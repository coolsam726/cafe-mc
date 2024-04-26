<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources\ArticleResource\Pages;

use Filament\Actions;
use Filament\Resources\Components\Tab;
use Filament\Resources\Pages\ManageRecords;
use Illuminate\Database\Eloquent\Builder;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\ArticleResource;

class ManageArticles extends ManageRecords
{
    protected static string $resource = ArticleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function getTabs(): array
    {
        return [
            Tab::make('Raw Materials')->modifyQueryUsing(function (Builder $query) {
                $query->where('is_product', '=', false)->where('is_consumable', '=', false);
            }),
            Tab::make('Consumable Items')->modifyQueryUsing(function (Builder $query) {
                $query->where('is_product', '=', false)->where('is_consumable', '=', true);
            }),
            Tab::make('Finished Products')->modifyQueryUsing(function (Builder $query) {
                $query->where('is_product', '=', true);
            }),
        ];
    }
}
