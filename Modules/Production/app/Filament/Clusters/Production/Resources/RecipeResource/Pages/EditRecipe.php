<?php

namespace Modules\Production\Filament\Clusters\Production\Resources\RecipeResource\Pages;

use Filament\Pages\Concerns\HasSubNavigation;
use Modules\Production\Filament\Clusters\Production\Resources\RecipeResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditRecipe extends EditRecord
{
    use HasSubNavigation;
    protected static string $resource = RecipeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
