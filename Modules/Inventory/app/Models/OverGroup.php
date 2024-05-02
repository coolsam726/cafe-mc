<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Modules\Core\Concerns\HasAudit;

class OverGroup extends Model
{
    use HasAudit;
    /**
     * The attributes that are mass assignable.
     */
    protected $guarded = ['id'];

    public function majorGroups(): HasMany
    {
        return $this->hasMany(MajorGroup::class);
    }
}
