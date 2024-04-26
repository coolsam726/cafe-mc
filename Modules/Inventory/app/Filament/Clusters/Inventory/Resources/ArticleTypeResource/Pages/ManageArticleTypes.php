<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\ArticleTypeResource\Pages;

use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\ArticleTypeResource;

class ManageArticleTypes extends ManageRecords
{
    protected static string $resource = ArticleTypeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
