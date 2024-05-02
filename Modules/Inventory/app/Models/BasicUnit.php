<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Modules\Core\Concerns\HasAudit;

class BasicUnit extends Model
{
    use HasAudit;
    protected $guarded = ['id'];

    public function derivedUnits(): HasMany
    {
        return $this->hasMany(DerivedUnit::class);
    }
}
