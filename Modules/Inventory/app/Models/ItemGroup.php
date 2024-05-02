<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;

class ItemGroup extends Model
{
    use HasAudit;
    protected $guarded = ['id'];

    public function majorGroup(): BelongsTo
    {
        return $this->belongsTo(MajorGroup::class);
    }
}
