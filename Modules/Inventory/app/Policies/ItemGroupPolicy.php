<?php

namespace Modules\Inventory\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Modules\Core\Concerns\StandardPolicy;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\ItemGroupResource;

class ItemGroupPolicy
{
    use HandlesAuthorization, StandardPolicy;

    public function getResourceClass(): string
    {
        return ItemGroupResource::class;
    }
}
