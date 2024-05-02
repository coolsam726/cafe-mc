<?php

namespace Modules\Production\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;
use Modules\Inventory\Models\Article;
use Modules\Inventory\Models\DerivedUnit;
use Modules\Production\Database\Factories\RecipeItemFactory;
use function Modules\Inventory\inventory;

class RecipeItem extends Model
{
    use HasFactory;
    use HasAudit;

    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    protected static function newFactory(): RecipeItemFactory
    {
        return RecipeItemFactory::new();
    }
    public function recipe(): BelongsTo
    {
        return $this->belongsTo(Recipe::class,'recipe_id');
    }

    public function article(): BelongsTo
    {
        return $this->belongsTo(Article::class,'article_id');
    }

    public function unit(): BelongsTo
    {
        return $this->belongsTo(DerivedUnit::class,'unit_id');
    }

    public function getUnitCostAttribute(): float|int
    {
        $articleCost = $this->article->valuation_rate; // in purchase units
        return fdiv($articleCost,inventory()->convertUnits($this->article->purchase_unit_id ?? $this->article->storage_unit_id, $this->unit_id));
    }

    public function getCostAttribute(): float|int
    {
        return $this->unit_cost * $this->quantity;
    }
}
