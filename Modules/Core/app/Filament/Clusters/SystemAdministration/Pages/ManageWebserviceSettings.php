<?php

namespace Modules\Core\Filament\Clusters\SystemAdministration\Pages;

use BezhanSalleh\FilamentShield\Traits\HasPageShield;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\SettingsPage;
use Modules\Core\Filament\Clusters\SystemAdministration;
use Modules\Core\Settings\WebserviceSettings;

class ManageWebserviceSettings extends SettingsPage
{
    use HasPageShield;

    protected static ?string $navigationIcon = 'heroicon-o-cog-6-tooth';

    protected static string $settings = WebserviceSettings::class;

    protected static ?int $navigationSort = 100;

    protected static ?string $navigationLabel = 'Webservice Settings';

    protected static ?string $cluster = SystemAdministration::class;

    public static function getNavigationGroup(): ?string
    {
        return 'Settings';
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make([
                    Forms\Components\TextInput::make('base_url')->required()->columnSpanFull(),
                ]),

                Forms\Components\Section::make([
                    Forms\Components\Fieldset::make('Webservice Endpoints')->schema([
                        Forms\Components\TextInput::make('staff_by_username_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                        Forms\Components\TextInput::make('staff_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                        Forms\Components\TextInput::make('student_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                        Forms\Components\TextInput::make('all_staff_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                        Forms\Components\TextInput::make('all_active_students_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                        Forms\Components\TextInput::make('all_current_students_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                        Forms\Components\TextInput::make('all_departments_endpoint')->helperText('insert parameters as {param1}/{param2} where necessary'),
                    ]),
                ]),
            ]);
    }

    public function notify(string $color, $message)
    {
        return Notification::make($color)->color($color)->body($message)->send();
    }
}
