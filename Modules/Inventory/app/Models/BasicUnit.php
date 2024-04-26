<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class BasicUnit extends Model
{
    protected $guarded = ['id'];

    public function derivedUnits(): HasMany
    {
        return $this->hasMany(DerivedUnit::class);
    }
}
