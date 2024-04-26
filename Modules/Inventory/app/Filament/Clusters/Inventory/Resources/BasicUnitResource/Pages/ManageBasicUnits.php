<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\BasicUnitResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\BasicUnitResource;

class ManageBasicUnits extends ManageRecords
{
    protected static string $resource = BasicUnitResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
