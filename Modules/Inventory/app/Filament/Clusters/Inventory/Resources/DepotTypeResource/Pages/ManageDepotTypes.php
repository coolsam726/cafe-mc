<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\DepotTypeResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\DepotTypeResource;

class ManageDepotTypes extends ManageRecords
{
    protected static string $resource = DepotTypeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
