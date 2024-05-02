<?php

namespace Modules\Production\Filament\Clusters\Production\Resources\RecipeResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\HtmlString;
use Modules\Inventory\Models\Article;
use Modules\Inventory\Models\DerivedUnit;

class ItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'items';

    public function hasCombinedRelationManagerTabsWithForm(): bool
    {
        return true;
    }
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('article_id')
                    ->required()
                    ->live()
                    ->relationship('article','name', fn($query) => $query->whereIsProduct(false)->whereEnabled(true))
                    ->searchable()->preload()
                ->afterStateUpdated(fn($state, Forms\Set $set) => $set('unit_id', Article::find($state)?->storage_unit_id)),

                Forms\Components\Select::make('unit_id')
                    ->required()
                    ->visible(fn($get) => $get('article_id'))
                    ->relationship('unit','name', fn(Builder|DerivedUnit $query, $get) => $query->siblingOf(Article::find($get('article_id'))?->storageUnit)->whereEnabled(true))
                    ->searchable()->preload(),

                Forms\Components\TextInput::make('quantity')
                    ->numeric()
                    ->extraInputAttributes(['class' => 'font-black']),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('article.name')
            ->columns([
                Tables\Columns\Layout\Split::make([
                    Tables\Columns\Layout\Stack::make([
                        Tables\Columns\TextColumn::make('article.name')
                            ->visible(fn() => static::canEdit(static::getOwnerRecord()))
                            ->formatStateUsing(fn($state) => new HtmlString("<strong class='font-black text-xl'>$state</strong>")),
                        Tables\Columns\TextColumn::make('quantity')->numeric(4)->extraAttributes(['class' => 'font-black']),
                        Tables\Columns\TextColumn::make('unit.name')->alignRight()->label('Unit')->prefix('Unit: '),
                        Tables\Columns\TextColumn::make('unit_cost')->alignRight()->label('Unit Cost')->prefix('Unit Cost: ')->money('kes'),
                        Tables\Columns\TextColumn::make('cost')->alignRight()->label('Cost')->prefix('Cost: ')->money('kes'),
                    ]),
                ])->from('md')
            ])
            ->defaultPaginationPageOption(50)
            ->contentGrid(['md' => 2,'xl' => 3])
            ->recordClasses('space-2')
            ->reorderable('sort')
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
