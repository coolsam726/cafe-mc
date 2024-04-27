<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\BatchResource\Pages;

use Modules\Inventory\Filament\Clusters\Inventory\Resources\BatchResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageBatches extends ManageRecords
{
    protected static string $resource = BatchResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
