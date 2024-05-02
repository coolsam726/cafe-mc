<?php

namespace Modules\Production\Filament\Clusters\Production\Resources\RecipeResource\Pages;

use Modules\Production\Filament\Clusters\Production\Resources\RecipeResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRecipes extends ListRecords
{
    protected static string $resource = RecipeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
