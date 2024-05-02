<?php

namespace Modules\Production\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;
use Modules\Core\Concerns\HasCode;
use Modules\Core\Concerns\HasTeam;
use Modules\Inventory\Concerns\HasStock;
use Modules\Inventory\Models\Article;
use Modules\Production\Database\Factories\FinishedProductFactory;

class Product extends Model
{
    use HasTeam, HasAudit, HasStock;
    use HasFactory, HasCode;

    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    protected static function newFactory(): FinishedProductFactory
    {
        return FinishedProductFactory::new();
    }

    public function article(): BelongsTo
    {
        return $this->belongsTo(Article::class,'article_id');
    }
    public function migratedArticle(): BelongsTo
    {
        return $this->belongsTo(Article::class,'migrated_article_id');
    }
}
