<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\MajorGroupResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\MajorGroupResource;

class ManageMajorGroups extends ManageRecords
{
    protected static string $resource = MajorGroupResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
