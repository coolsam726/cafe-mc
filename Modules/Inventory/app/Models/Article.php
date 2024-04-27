<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;
use Modules\Inventory\Concerns\HasStock;

class Article extends Model
{
    use HasStock, HasAudit;
    protected $guarded = ['id'];

    public function articleType(): BelongsTo
    {
        return $this->belongsTo(ArticleType::class);
    }

    public function itemGroup(): BelongsTo
    {
        return $this->belongsTo(ItemGroup::class);
    }

    public function defaultDepot(): BelongsTo
    {
        return $this->belongsTo(Depot::class, 'default_depot_id');
    }

    public function storageUnit(): BelongsTo
    {
        return $this->belongsTo(DerivedUnit::class, 'storage_unit_id');
    }

    public function purchaseUnit(): BelongsTo
    {
        return $this->belongsTo(DerivedUnit::class, 'purchase_unit_id');
    }
}
