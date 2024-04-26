<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\DepotResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\DepotResource;

class ManageDepots extends ManageRecords
{
    protected static string $resource = DepotResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
