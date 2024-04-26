<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Modules\Inventory\Filament\Clusters\Inventory;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\ArticleResource\Pages;
use Modules\Inventory\Models\Article;
use Modules\Inventory\Models\ArticleType;

class ArticleResource extends Resource
{
    protected static ?string $model = Article::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationGroup = 'Items';

    protected static ?string $cluster = Inventory::class;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->live(onBlur: true)
                    ->afterStateUpdated(fn ($state, Forms\Set $set) => $set('slug', str($state)->slug()))
                    ->maxLength(191),
                Forms\Components\Hidden::make('slug'),
                Forms\Components\Placeholder::make('slug')->label('Slug')->content(fn ($state) => $state),
                Forms\Components\Fieldset::make('Flags')->schema([
                    Forms\Components\Toggle::make('is_consumable')
                        ->required(),
                    Forms\Components\Toggle::make('is_product')
                        ->required(),
                    Forms\Components\Toggle::make('enabled')
                        ->required()->default(true),
                ])->columnSpanFull()->columns(3),
                Forms\Components\ToggleButtons::make('article_type_id')
                    ->label('Article Type')
                    ->options(ArticleType::where('enabled', true)->pluck('name', 'id'))
                    ->required()->inline(),
                Forms\Components\Select::make('item_group_id')
                    ->relationship('itemGroup', 'name', fn ($query) => $query->where('enabled', true))
                    ->required()->searchable()->preload(),
                Forms\Components\Select::make('purchase_unit_id')
                    ->label('Purchasing Unit')
                    ->relationship('purchaseUnit', 'name')
                    ->required(fn (Forms\Get $get) => ! $get('is_product'))->helperText('The minimum unit of purchase from suppliers.'),
                Forms\Components\Select::make('storage_unit_id')
                    ->label('Storage Unit')
                    ->relationship('storageUnit', 'name')
                    ->required(),

                Forms\Components\TextInput::make('last_purchase_price')
                    ->numeric()
                    ->default(null),
                Forms\Components\TextInput::make('last_ordered_quantity')
                    ->numeric()
                    ->default(null),
                Forms\Components\DateTimePicker::make('last_order_time'),
                Forms\Components\TextInput::make('lifespan_days')
                    ->required()
                    ->numeric()
                    ->default(7),
                Forms\Components\TextInput::make('last_received_quantity')
                    ->numeric()
                    ->default(null),
                Forms\Components\TextInput::make('last_receiving_price')
                    ->numeric()
                    ->default(null),
                Forms\Components\DateTimePicker::make('last_received_at'),
                Forms\Components\TextInput::make('weighted_cost')
                    ->required()
                    ->numeric()
                    ->default(0.00),
                Forms\Components\TextInput::make('stock_reorder_level')
                    ->required()
                    ->numeric()
                    ->default(5),
                Forms\Components\Textarea::make('description')
                    ->columnSpanFull(),

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
                        Tables\Columns\TextColumn::make('itemGroup.name')
                            ->numeric()
                            ->sortable(),
                    ]),
                    Tables\Columns\Layout\Stack::make([
                        Tables\Columns\TextColumn::make('last_purchase_price')->money('kes')
                            ->extraAttributes(['class' => 'font-bold'])
                            ->alignRight(),
                        Tables\Columns\TextColumn::make('last_purchase_price')
                            ->alignRight()->extraAttributes(['class' => 'font-light text-sm'])
                            ->formatStateUsing(fn ($state) => 'Last purchase Price'),
                    ])->visible(fn ($record) => ! $record->is_product),
                ])->from('md'),
                Tables\Columns\Layout\Panel::make([
                    Tables\Columns\TextColumn::make('articleType.name')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('defaultDepot.name')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('derivedUnit.name')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('last_purchase_price')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('last_ordered_quantity')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('last_order_time')
                        ->dateTime()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('lifespan_days')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\IconColumn::make('is_product')
                        ->boolean(),
                    Tables\Columns\TextColumn::make('last_received_quantity')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('last_receiving_price')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('last_received_at')
                        ->dateTime()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('weighted_cost')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\IconColumn::make('enabled')
                        ->boolean(),
                    Tables\Columns\TextColumn::make('created_at')
                        ->dateTime()
                        ->sortable()
                        ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\TextColumn::make('updated_at')
                        ->dateTime()
                        ->sortable()
                        ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\IconColumn::make('is_consumable')
                        ->boolean(),
                    Tables\Columns\TextColumn::make('stock_reorder_level')
                        ->numeric()
                        ->sortable(),
                ])->collapsed(),
            ])->contentGrid([
                'md' => 2,
                'lg' => 2,
            ])->recordClasses(fn ($record) => $record->enabled ? 'active' : 'inactive')
            ->filters([
                Tables\Filters\TernaryFilter::make('enabled')->label('Record Status')
                    ->trueLabel('Only Active')->falseLabel('Only Inactive')
                    ->default(),
            ])
            ->filtersLayout(Tables\Enums\FiltersLayout::AboveContent)
            ->actions([
                Tables\Actions\ViewAction::make(),
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
            'index' => Pages\ManageArticles::route('/'),
        ];
    }
}
