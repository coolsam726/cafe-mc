<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Modules\Inventory\Filament\Clusters\Inventory;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\StockMutationResource\Pages;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\StockMutationResource\RelationManagers;
use Modules\Inventory\Models\StockMutation;

class StockMutationResource extends Resource
{
    protected static ?string $model = StockMutation::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $cluster = Inventory::class;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('stockable_type')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('stockable_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('reference_type')
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\TextInput::make('reference_id')
                    ->numeric()
                    ->default(null),
                Forms\Components\Select::make('batch_id')
                    ->relationship('batch', 'id')
                    ->default(null),
                Forms\Components\TextInput::make('new_quantity')
                    ->required()
                    ->numeric(),
                Forms\Components\Textarea::make('narration')
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('created_by')
                    ->numeric()
                    ->default(null),
                Forms\Components\TextInput::make('prev_quantity')
                    ->numeric()
                    ->default(null),
                Forms\Components\TextInput::make('hash')
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\Select::make('location_id')
                    ->relationship('location', 'name')
                    ->default(null),
                Forms\Components\Select::make('creator_id')
                    ->relationship('creator', 'name')
                    ->default(null),
                Forms\Components\Select::make('updater_id')
                    ->relationship('updater', 'name')
                    ->default(null),
                Forms\Components\TextInput::make('ip_address')
                    ->maxLength(45)
                    ->default(null),
                Forms\Components\Toggle::make('is_immutable')
                    ->required(),
                Forms\Components\Select::make('company_id')
                    ->relationship('company', 'name')
                    ->default(null),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns(static::getTableCols())
            ->contentGrid(['md' => 2, 'xl' => 3])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])->headerActions([
                Tables\Actions\Action::make('toggle-grid-view')
                    ->icon(fn() => static::gridViewEnabled() ? 'heroicon-o-table-cells' : 'heroicon-o-squares-2x2')
                    ->label(fn() => static::gridViewEnabled() ? 'Tabular View' : 'Grid View')
                    ->color('gray')
                    ->action(function ($livewire) {
                        session()->has('stock-mutations-grid-view') ? session()->forget('stock-mutations-grid-view') : session(['stock-mutations-grid-view' => true]);
                        // Refresh this livewire component
                    }),
            ]);
    }

    public static function gridViewEnabled(): bool
    {
        return session('stock-mutations-grid-view', false);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageStockMutations::route('/'),
        ];
    }

    private static function getTableCols(): array
    {
        return static::gridViewEnabled() ? static::tableAsGrid() : static::tableAsList();
    }

    private static function tableAsGrid(): array
    {
        return [
            Tables\Columns\Layout\Split::make([
                Tables\Columns\Layout\Stack::make([
                    Tables\Columns\TextColumn::make('created_at')
                        ->dateTime()
                        ->sortable()
                        ->toggleable(isToggledHiddenByDefault: true),

                    Tables\Columns\TextColumn::make('stockable_id')
                        ->label('Item Details')
                        ->tooltip('Item Details')
                        ->extraAttributes(['class' => 'text-primary font-black'])
                        ->formatStateUsing(fn($record) => $record->stockable_details),
                    Tables\Columns\TextColumn::make('batch.batch_number')
                        ->label('Batch No.')
                        ->prefix('Batch No: ')
                        ->sortable(),
                    Tables\Columns\TextColumn::make('location.name')
                        ->label('Location')
                        ->prefix('Location: ')
                        ->sortable(),
                    Tables\Columns\TextColumn::make('prev_quantity')
                        ->numeric()
                        ->prefix('Prev Qty: ')
                        ->sortable(),
                    Tables\Columns\TextColumn::make('new_quantity')
                        ->numeric()
                        ->extraAttributes(['class' => 'text-primary font-black'])
                        ->prefix('New Qty: ')
                        ->sortable(),
                ]),
            ])->from('md'),
            Tables\Columns\Layout\Panel::make([
                Tables\Columns\TextColumn::make('narration')->columnSpanFull(),
            ])->collapsed()
        ];
    }

    private static function tableAsList(): array
    {
        return [
            Tables\Columns\TextColumn::make('stockable_id')
                ->label('Item Details')
                ->formatStateUsing(fn($record) => $record->stockable_details)
                ->sortable(),
            Tables\Columns\TextColumn::make('batch.batch_number')
                ->label('Batch No.')
                ->sortable(),
            Tables\Columns\TextColumn::make('location.name')
                ->numeric()
                ->sortable(),
            Tables\Columns\TextColumn::make('prev_quantity')
                ->numeric()
                ->sortable(),
            Tables\Columns\TextColumn::make('new_quantity')
                ->numeric()
                ->sortable(),
            Tables\Columns\TextColumn::make('hash')
                ->searchable()->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('created_at')
                ->dateTime()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('updated_at')
                ->dateTime()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('creator.name')
                ->sortable()->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('updater.name')
                ->numeric()
                ->sortable()->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('ip_address')
                ->searchable()->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\IconColumn::make('is_immutable')
                ->boolean()->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('company.name')
                ->sortable()->toggleable(isToggledHiddenByDefault: true),
        ];
    }
}
