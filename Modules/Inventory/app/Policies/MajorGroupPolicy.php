<?php

namespace Modules\Inventory\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Modules\Core\Concerns\StandardPolicy;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\MajorGroupResource;

class MajorGroupPolicy
{
    use HandlesAuthorization, StandardPolicy;

    public function getResourceClass(): string
    {
        return MajorGroupResource::class;
    }
}
