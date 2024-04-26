<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class OverGroup extends Model
{
    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    public function majorGroups(): HasMany
    {
        return $this->hasMany(MajorGroup::class);
    }
}
