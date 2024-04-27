<?php

namespace Modules\Inventory\Concerns;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Modules\Inventory\Models\Batch;
use Modules\Inventory\Models\Depot;
use Modules\Inventory\Models\StockMutation;
use function Modules\Inventory\stock;

/**
 * @mixin Model
 *
 */
trait HasStock
{
    public function mutations(): MorphMany
    {
        return $this->morphMany(StockMutation::class, 'stockable');
    }

    public function batches(): MorphMany
    {
        return $this->morphMany(Batch::class, 'stockable');
    }

    public function getStock(Depot|null $location = null, ?Batch $batch = null): Collection|\Illuminate\Support\Collection
    {
        return stock()->getStock($this, $location, $batch);
    }
}