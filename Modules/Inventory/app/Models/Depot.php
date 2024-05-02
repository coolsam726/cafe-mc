<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Core\Concerns\HasAudit;
use Modules\Core\Concerns\HasTeam;

class Depot extends Model
{
    use HasAudit;
    use HasTeam;

    public function depotType(): BelongsTo
    {
        return $this->belongsTo(DepotType::class, 'depot_type_id');
    }
}
