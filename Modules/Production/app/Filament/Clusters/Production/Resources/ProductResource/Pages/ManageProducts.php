<?php

namespace Modules\Production\Filament\Clusters\Production\Resources\ProductResource\Pages;

use Modules\Production\Filament\Clusters\Production\Resources\ProductResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageProducts extends ManageRecords
{
    protected static string $resource = ProductResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
