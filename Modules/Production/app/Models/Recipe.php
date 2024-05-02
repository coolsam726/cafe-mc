<?php

namespace Modules\Production\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Modules\Core\Concerns\HasAudit;
use Modules\Core\Concerns\HasTeam;
use Modules\Production\Database\Factories\RecipeFactory;

class Recipe extends Model
{
    use HasFactory;
    use HasTeam, HasAudit;

    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    protected static function newFactory(): RecipeFactory
    {
        return RecipeFactory::new();
    }

    public function items(): HasMany
    {
        return $this->hasMany(RecipeItem::class,'recipe_id');
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function getCostAttribute() {
        return $this->items->sum(fn($item) => $item->cost);
    }
    public function getUnitCostAttribute(): float
    {
        return fdiv($this->cost, $this->yield ?: 1.0);
    }

    public function getCalculatedSalePriceAttribute(): float|int
    {
        $overhead = fdiv(floatval(config('production.percentage_overhead_costs',1.0)),100.0);
        $margin = fdiv(floatval(config('production.percentage_profit_margin',1.0)),100.0);

        return $this->unit_cost * (1 + $margin) + (1 + $overhead);
    }

    public function recipeGroup(): BelongsTo
    {
        return $this->belongsTo(RecipeGroup::class,'recipe_group_id');
    }
}
