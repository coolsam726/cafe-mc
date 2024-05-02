<?php

namespace Modules\Production\Filament\Clusters\Production\Resources;

use Modules\Production\Filament\Clusters\Production;
use Modules\Production\Filament\Clusters\Production\Resources\ProductResource\Pages;
use Modules\Production\Filament\Clusters\Production\Resources\ProductResource\RelationManagers;
use Modules\Production\Models\Product;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $cluster = Production::class;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('code')
                    ->maxLength(30)
                    ->disabled(fn($record) => $record)->placeholder('leave blank to auto-generate'),
                Forms\Components\TextInput::make('suggested_sale_price')
                    ->required()
                    ->numeric()
                    ->default(0.00),
                Forms\Components\Toggle::make('is_active')
                    ->required()->default(true),
                Forms\Components\Toggle::make('is_direct_item')
                    ->live()
                    ->required(),
                Forms\Components\Select::make('article_id')
                    ->relationship('article', 'name', fn($query) => $query->whereIsProduct(true))
                    ->visible(fn($get) => $get('is_direct_item'))
                    ->required()
                    ->preload()
                    ->searchable()
                    ->default(null),
            ])->columns(['md' => 2, 'lg' => 3]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('code')
                    ->searchable()->sortable(),
                Tables\Columns\TextColumn::make('name')
                    ->searchable()->sortable(),
                Tables\Columns\TextColumn::make('suggested_sale_price')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean()->sortable(),
                Tables\Columns\IconColumn::make('is_direct_item')
                    ->boolean()->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])->recordClasses(fn($record) => $record->is_active ? 'active': 'inactive')
            ->filters([
                //
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

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageProducts::route('/'),
        ];
    }
}
