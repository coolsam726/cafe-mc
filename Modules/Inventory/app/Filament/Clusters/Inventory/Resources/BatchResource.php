<?php

namespace Modules\Inventory\Filament\Clusters\Inventory\Resources;

use Modules\Inventory\Filament\Clusters\Inventory;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\BatchResource\Pages;
use Modules\Inventory\Filament\Clusters\Inventory\Resources\BatchResource\RelationManagers;
use Modules\Inventory\Models\Batch;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BatchResource extends Resource
{
    protected static ?string $model = Batch::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $cluster = Inventory::class;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('company_id')
                    ->relationship('company', 'name')
                    ->default(null),
                Forms\Components\TextInput::make('batch_number')
                    ->required()
                    ->maxLength(255),
                Forms\Components\DateTimePicker::make('batch_date')
                    ->required(),
                Forms\Components\Textarea::make('narration')
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('initial_quantity')
                    ->numeric()
                    ->default(null),
                Forms\Components\TextInput::make('current_quantity')
                    ->numeric()
                    ->default(null),
                Forms\Components\Select::make('location_id')
                    ->relationship('location', 'name')
                    ->default(null),
                Forms\Components\TextInput::make('stockable_type')
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\TextInput::make('stockable_id')
                    ->numeric()
                    ->default(null),
                Forms\Components\DatePicker::make('manufacture_date'),
                Forms\Components\DatePicker::make('expiry_date'),
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
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('company.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('batch_number')
                    ->searchable(),
                Tables\Columns\TextColumn::make('batch_date')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('initial_quantity')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('current_quantity')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('location.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('stockable_type')
                    ->searchable(),
                Tables\Columns\TextColumn::make('stockable_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('manufacture_date')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('expiry_date')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('creator.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('updater.name')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('ip_address')
                    ->searchable(),
                Tables\Columns\IconColumn::make('is_immutable')
                    ->boolean(),
            ])
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
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageBatches::route('/'),
        ];
    }
}
