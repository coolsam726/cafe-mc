<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ArticleType extends Model
{
    protected $guarded = ['id'];

    public function articles(): HasMany
    {
        return $this->hasMany(Article::class);
    }
}
