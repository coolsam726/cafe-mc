<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ItemGroup extends Model
{
    protected $guarded = ['id'];

    public function majorGroup(): BelongsTo
    {
        return $this->belongsTo(MajorGroup::class);
    }
}
