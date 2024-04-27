<?php

namespace Modules\Inventory\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Modules\Core\Concerns\StandardPolicy;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\StockMutationResource;

class StockMutationPolicy
{
    use HandlesAuthorization, StandardPolicy;

    public function getResourceClass(): string
    {
        return StockMutationResource::class;
    }
}
