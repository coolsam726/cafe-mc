<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;

class MajorGroup extends Model
{
    use HasAudit;
    protected $guarded = ['id'];

    public function overGroup(): BelongsTo
    {
        return $this->belongsTo(OverGroup::class, 'over_group_id');
    }
}
