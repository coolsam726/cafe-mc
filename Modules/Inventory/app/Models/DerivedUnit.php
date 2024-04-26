<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DerivedUnit extends Model
{
    protected $guarded = ['id'];

    public function basicUnit(): BelongsTo
    {
        return $this->belongsTo(BasicUnit::class);
    }
}
