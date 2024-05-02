<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Attributes\ObservedBy;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use Modules\Core\Concerns\HasAudit;
use Modules\Core\Concerns\HasTeam;
use Modules\Inventory\Observers\StockMutationObserver;
use function Modules\Inventory\stock;

#[ObservedBy(StockMutationObserver::class)]
class StockMutation extends Model
{
    use HasTeam, HasAudit;

    protected $guarded = ['id'];

    public function batch(): BelongsTo
    {
        return $this->belongsTo(Batch::class, 'batch_id');
    }

    public function stockable(): MorphTo
    {
        return $this->morphTo('stockable');
    }

    public function location(): BelongsTo
    {
        return $this->belongsTo(Depot::class, 'location_id');
    }

    public function getStockableDetailsAttribute()
    {
        return $this->stockable->details;
    }

    public function integrityCheck(): Attribute
    {
        return Attribute::make(
            get: function () {
                try {
                    return stock()->validateHash($this);
                } catch (\Throwable $exception) {
                    return false;
                }
            })->shouldCache();
    }
}
