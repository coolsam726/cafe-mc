<?php

namespace Modules\Production\Filament\Clusters\Production\Resources;

use Filament\Infolists\Components\Section;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Modules\Production\Filament\Clusters\Production;
use Modules\Production\Filament\Clusters\Production\Resources\RecipeResource\Pages;
use Modules\Production\Filament\Clusters\Production\Resources\RecipeResource\RelationManagers;
use Modules\Production\Models\Product;
use Modules\Production\Models\Recipe;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class RecipeResource extends Resource
{
    protected static ?string $model = Recipe::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $cluster = Production::class;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make([
                    Forms\Components\Select::make('product_id')
                        ->relationship('product', 'name', fn($query) => $query->whereIsActive(true))
                    ->searchable()->preload()->live()->afterStateUpdated(fn($set, $state) => $state && $set('name', str(Product::find($state)->name)->replace('(PA)','')->trim())),
                    Forms\Components\TextInput::make('name')
                        ->required()
                        ->maxLength(191),
                    Forms\Components\Select::make('recipe_group_id')
                    ->relationship('recipeGroup','name',fn($query) => $query->whereEnabled(true)),
                    Forms\Components\TextInput::make('yield')
                        ->required()
                        ->numeric(),
                    Forms\Components\Toggle::make('enabled')
                        ->required()->default(true),
                ])->columns(['md' => 2]),
                Forms\Components\Section::make()
                    ->description('Click this section to expand and edit description')
                    ->schema([
                    Forms\Components\RichEditor::make('description')
                        ->columnSpanFull(),
                ])->collapsed()
            ]);
    }

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist->schema([
           Section::make([
               TextEntry::make('name')->label(__('Name:')),
               TextEntry::make('product.name')->label(__('Product:')),
               TextEntry::make('yield')->label(__('Yield (Pax):')),
               TextEntry::make('enabled')
                   ->label(__('Status:'))
                   ->badge()->color(fn($state) => match ($state) {
                   true, 1 => 'success',
                   false, 0 => 'danger',
                   default => 'gray'
               })->formatStateUsing(fn($state) => $state ? __('Active'): __('Inactive'))
           ])->columns(['md' => 2, 'xl' => 4]),
            Section::make()->description('Click to view Description')->schema([
                TextEntry::make('description')->html()->extraAttributes(['class' => 'prose min-w-7xl'])
            ])->collapsed()
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\Layout\Split::make([
                    Tables\Columns\Layout\Stack::make([
                        Tables\Columns\TextColumn::make('name')
                            ->searchable()->extraAttributes(['class' => 'font-black']),
                        Tables\Columns\TextColumn::make('recipeGroup.name')
                            ->sortable()->searchable()->prefix('Group: '),
                    ]),

                ])->from('md'),
                Tables\Columns\Layout\Panel::make([
                    Tables\Columns\TextColumn::make('product.name')
                        ->sortable()->searchable()->prefix('Product: '),
                    Tables\Columns\TextColumn::make('yield')
                        ->numeric()
                        ->formatStateUsing(fn($state) => str($state)->append(str(' Portion')->plural(intval($state))))
                        ->sortable()->prefix('Yield: '),
                    Tables\Columns\TextColumn::make('created_at')
                        ->dateTime()
                        ->sortable()->prefix('Creation Date: ')
                        ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\TextColumn::make('updated_at')
                        ->dateTime()
                        ->sortable()->prefix('Last Updated: ')
                        ->toggleable(isToggledHiddenByDefault: true),
                ])->collapsed()
            ])
            ->contentGrid(['md' => 2, 'xl' => 3])
            ->recordClasses(fn($record) => $record->enabled ? 'active' : 'inactive')
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\ItemsRelationManager::make(),
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListRecipes::route('/'),
            'create' => Pages\CreateRecipe::route('/create'),
            'view' => Pages\ViewRecipe::route('/{record}'),
            'edit' => Pages\EditRecipe::route('/{record}/edit'),
        ];
    }
}
