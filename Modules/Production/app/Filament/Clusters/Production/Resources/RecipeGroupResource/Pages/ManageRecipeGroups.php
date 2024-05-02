<?php

namespace Modules\Production\Filament\Clusters\Production\Resources\RecipeGroupResource\Pages;

use Modules\Production\Filament\Clusters\Production\Resources\RecipeGroupResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageRecipeGroups extends ManageRecords
{
    protected static string $resource = RecipeGroupResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
