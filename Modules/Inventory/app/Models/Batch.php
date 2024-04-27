<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Modules\Core\Concerns\HasAudit;
use Modules\Core\Concerns\HasTeam;

class Batch extends Model
{
    use HasTeam, HasAudit;
    protected $guarded = ['id'];

    public function stockMutations(): HasMany
    {
        return $this->hasMany(StockMutation::class,'batch_id');
    }

    public function location(): BelongsTo
    {
        return $this->belongsTo(Depot::class,'location_id');
    }
}
