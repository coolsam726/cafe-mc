<?php

namespace Modules\Production\Filament\Clusters\Production\Resources\RecipeResource\Pages;

use Filament\Pages\Concerns\HasSubNavigation;
use Modules\Production\Filament\Clusters\Production\Resources\RecipeResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewRecipe extends ViewRecord
{
    use HasSubNavigation;
    protected static string $resource = RecipeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
