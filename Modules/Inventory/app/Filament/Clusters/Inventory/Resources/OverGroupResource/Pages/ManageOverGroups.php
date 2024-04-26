<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\OverGroupResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\OverGroupResource;

class ManageOverGroups extends ManageRecords
{
    protected static string $resource = OverGroupResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
