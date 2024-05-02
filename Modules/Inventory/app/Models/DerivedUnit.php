<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;

class DerivedUnit extends Model
{
    use HasAudit;
    protected $guarded = ['id'];

    public function basicUnit(): BelongsTo
    {
        return $this->belongsTo(BasicUnit::class);
    }

    public function scopeSiblingOf(Builder $query, DerivedUnit|Model|null $unit): Builder
    {
        if (!$unit) {
            return $query;
        }
        return $query->where('basic_unit_id', $unit->basic_unit_id);
    }
}
