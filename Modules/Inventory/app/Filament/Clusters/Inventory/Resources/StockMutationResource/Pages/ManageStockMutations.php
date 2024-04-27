<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\StockMutationResource\Pages;

use Modules\Inventory\Filament\Clusters\Inventory\Resources\StockMutationResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageStockMutations extends ManageRecords
{
    protected static string $resource = StockMutationResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
