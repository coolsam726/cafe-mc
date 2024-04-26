<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\ItemGroupResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\ItemGroupResource;

class ManageItemGroups extends ManageRecords
{
    protected static string $resource = ItemGroupResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
