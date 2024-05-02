<?php

namespace Modules\Inventory\Support;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Modules\Core\Models\Team;
use Modules\Inventory\Concerns\HasStock;
use Modules\Inventory\Models\Article;
use Modules\Inventory\Models\Batch;
use Modules\Inventory\Models\Depot;
use Modules\Inventory\Models\DepotType;
use Modules\Inventory\Models\StockMutation;
use function Modules\Core\Support\core;

class Stock
{
    public function increaseStock(Model|Article $stockable, float $quantity, Depot $location, string $batch_number, ?string $reason = null): Model|StockMutation
    {
        $narration = 'Stock increase for ' . $stockable->name . ' at ' . $location->name . ' with batch number ' . $batch_number . ' by ' . $quantity . ' units.'.($reason ? ' Reason: '.$reason : '');
        // Find Stock, if it does not exist create a new one
        $batch = Batch::where('batch_number', $batch_number)->firstOrFail();
        // Save the stock changes
        return $this->saveStockChanges($stockable, $quantity, $location, $batch, $narration);
    }

    /**
     * Decrease stock for a stockable item
     *
     * @param  Model|Article  $stockable
     * @param  float  $quantity
     * @param  Depot  $location
     * @param  string|null  $reason
     * @return array returns an array of (key, value) pairs of batch numbers and the quantity decreased from each batch
     */
    public function decreaseStock(Model|Article $stockable, float $quantity, Depot $location, ?string $reason = null): array
    {
        Log::info('Decreasing stock for '.$stockable->name.' at '.$location->name.' by '.$quantity.' units');
        $dQ = abs($quantity) * -1;
        // Get all the batches for the stock for the current location
        /**
         * @var \Illuminate\Support\Collection|Collection|StockMutation[] $stocks
         */
        $stocks = $stockable->getStock($location);
        if ($stocks->count() <= 0) {
            throw new \RuntimeException('No stock found for '.$stockable->name.' at '.$location->name);
        }

        Log::info('Found '.$stocks->count().' unique batches with stock for '.$stockable->name.' at '.$location->name);

        $remaining = abs($quantity);
        $batch_numbers = [];
       // Loop through the batches and save stock until the quantity is exhausted
        foreach ($stocks as $stock) {
            $batch = Batch::find($stock->batch_id);
            Log::info("Remainder b/f: $remaining");
            $narration = 'Stock decrease for ' . $stockable->name . ' at ' . $location->name . ' with batch number ' . $batch->batch_number . ' by ' . $quantity . ' units.'.($reason ? ' Reason: '.$reason : '');
            $dq = min($remaining, $stock->new_quantity);
            $remaining -= $dq;
            $batch_numbers[$batch->batch_number] = $dq;
            $dq = $dq * -1;
            Log::info("Decreasing stock for $stockable->name batch No $batch->batch_number at $location->name by $dq units:");
            $this->saveStockChanges($stockable, $dq, $location, $batch, $narration);
            Log::info("Remainder c/f: $remaining");
            if ($remaining <= 0) {
                break;
            }
        }

        return $batch_numbers;
    }

    /**
     * Transfer stock from one location to another
     *
     * @param  Model|Article  $stockable
     * @param  float  $quantity
     * @param  Depot  $from
     * @param  Depot  $to
     * @param  string|null  $reason
     * @return array returns an array of (key, value) pairs of batch numbers and the quantity transferred from each batch
     */
    public function transferStock(Model|Article $stockable, float $quantity, Depot $from, Depot $to, ?string $reason = null): array
    {
        $narration = "Stock transfer of $quantity units from $from->name to $to->name".($reason ? ' with reason: '.$reason : '.');
        $dQ = abs($quantity);
        // Decrease stock from the source location
        $batch_numbers = $this->decreaseStock(
            stockable: $stockable,
            quantity: $dQ,
            location: $from,
            reason: $narration
        );
        // Increase stock at the destination location
        foreach ($batch_numbers as $batch_number => $dq) {
            $this->increaseStock(
                stockable: $stockable,
                quantity: $quantity,
                location: $to,
                batch_number: $batch_number,
                reason: $narration
            );
        }

        return $batch_numbers;
    }

    public function transferToAnotherTeam(Model|Article $stockable, float $quantity, Depot $sourceLocation, Team $targetTeam, Depot $targetLocation, string|null $batch_number = null,  ?string $narration = null)
    {

    }

    public function adjustStock(Model|Article $stockable, float $new_quantity, Depot $location, string $reason, ?string $batch_number = null): Model|array|StockMutation
    {
        $narration = 'Stock adjustment for ' . $stockable->name . ' at ' . $location->name . ' to ' . $new_quantity . ' units'.($reason ? ' with reason: '.$reason : '.');
        if (!$batch_number) {
            $batch_number = str(uniqid('BT'))->upper();
        }
        $batch = Batch::firstOrCreate(['batch_number' => $batch_number],[
            'current_quantity' => 0,
            'initial_quantity' => $new_quantity,
            'stockable_id' => $stockable->id,
            'stockable_type' => $stockable->getMorphClass(),
            'batch_date' => now(),
            'expiry_date' => now()->addDays($stockable->lifespan_days ?? 365),
            'narration' => $narration,
        ]);
        $current_stock = $stockable->getStock($location, $batch)->sum('new_quantity');
        Log::info("Current Stock is $current_stock");
        $dQ = $new_quantity - $current_stock;
        Log::info("Adjusting stock for $stockable->name at $location->name by $dQ units");
        if ($dQ > 0) {
            // If no batch, create a new batch
            return $this->increaseStock($stockable, abs($dQ), $location, $batch->batch_number, $narration);
        } elseif ($dQ < 0) {
            return $this->decreaseStock($stockable, abs($dQ), $location, $narration);
        } else {
            return [];
        }
    }

    protected function validateStockLevel(Model|Article $stockable, float $quantity, Depot|null $location = null, ?Batch $batch = null)
    {

    }

    private function saveStockChanges(Model|Article $stockable, float $dQ, Depot $location, Batch $batch, string $narration): Model|StockMutation
    {
        // if dQ is negative, validate that there is enough stock to decrease
        if ($dQ < 0) {
            $this->validateStockLevel($stockable, $dQ, $location, $batch);
        }
        // ensure $stockable has the HasStock trait
        if (!core()::class_has_trait($stockable, HasStock::class)) {
            throw new \InvalidArgumentException('The stockable model must use the HasStock trait');
        }
        // Create a mutation
        /**
         * @var Model|HasStock $stockable
         */
        return StockMutation::create([
            'prev_quantity' => $prev = $stockable->getStock($location, $batch)->sum('new_quantity'),
            'new_quantity' => $prev + $dQ,
            'location_id' => $location->id,
            'batch_id' => optional($batch)->id,
            'narration' => $narration,
            'is_immutable' => true,
            'stockable_id' => $stockable->id,
            'stockable_type' => $stockable->getMorphClass(),
            'hash' => $this->calculateHash($stockable, $location, $batch, $narration),
        ]);
    }

    private function calculateHash(Model|Article $stockable, Depot $location, Batch $batch, string $narration,bool $plainPayload = false)
    {
        $payload = str($stockable->getMorphClass())->replace('\\','.')
            ->append($stockable->getAttribute('id'))->append($location->id)->append($batch->batch_number)->append($narration)->replace(' ','_')->toString();
        if ($plainPayload) {
            return $payload;
        }
        return Hash::make($payload);
    }

    public function validateHash(StockMutation $mutation): bool
    {
        $check = Hash::check($this->calculateHash($mutation->stockable, $mutation->location, $mutation->batch, $mutation->narration, true), $mutation->hash);

        if (!$check) {
            throw new \RuntimeException('Stock mutation has been tampered with.');
        }

        return $check;
    }

    /**
     * Get the stock for a stockable item
     *
     * @param  Model|Article  $stockable
     * @param  Depot|null  $location
     * @param  Batch|null  $batch
     * @param  bool  $scopeToCompany
     * @param  bool  $excludeVirtual
     * @return Collection
     */
    public function getStock(Model|Article $stockable, Depot|null $location = null, ?Batch $batch = null,bool $scopeToCompany = true, bool $excludeVirtual = true): \Illuminate\Support\Collection
    {
        $subQuery = DB::table($table = StockMutation::getModel()->getTable())
            ->select('location_id', 'batch_id', DB::raw('MAX(id) as max_id'))
            ->where('stockable_id', $stockable->getAttribute('id'))
            ->where('stockable_type', $stockable->getMorphClass())
            ->groupBy('location_id', 'batch_id');

        $query = DB::table($table.' as t1')
            ->joinSub($subQuery, 't2', function ($join) {
                $join->on('t1.location_id', '=', 't2.location_id');
                $join->on('t1.batch_id', '=', 't2.batch_id');
                $join->on('t1.id', '=', 't2.max_id');
            });
        if ($excludeVirtual) {
            // join depot types
            $query->join('depots', 't1.location_id', '=', 'depots.id')
                ->join('depot_types', 'depots.depot_type_id', '=', 'depot_types.id')
                ->whereNot('depot_types.slug','=','virtual-store');
        }
        if ($location) {
            $query->where('t1.location_id', $location->id);
        }
        if ($batch) {
            $query->where('t1.batch_id', $batch->id);
        }
        if ($scopeToCompany && Auth::check()) {
            $query->where('t1.company_id', core()->current_team()?->id);
        }
        return $query->get();
    }
}