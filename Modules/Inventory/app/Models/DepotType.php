<?php

namespace Modules\Inventory\Models;

use Illuminate\Database\Eloquent\Model;
use Modules\Core\Concerns\HasAudit;

class DepotType extends Model
{
    use HasAudit;
    protected $guarded = ['id'];
}
