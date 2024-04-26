<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\DerivedUnitResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\DerivedUnitResource;

class ManageDerivedUnits extends ManageRecords
{
    protected static string $resource = DerivedUnitResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
