<?php

namespace Modules\Production\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;
use Modules\Inventory\Models\MajorGroup;
use Modules\Production\Database\Factories\RecipeGroupFactory;

class RecipeGroup extends Model
{
    use HasFactory;
    use HasAudit;

    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    protected static function newFactory(): RecipeGroupFactory
    {
        return RecipeGroupFactory::new();
    }

    public function majorGroup(): BelongsTo
    {
        return $this->belongsTo(MajorGroup::class,'major_group_id');
    }
}
