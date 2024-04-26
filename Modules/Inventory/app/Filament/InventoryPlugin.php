<?php

namespace Modules\Inventory\Filament;

use Coolsam\Modules\Concerns\ModuleFilamentPlugin;
use Filament\Contracts\Plugin;
use Filament\Panel;

class InventoryPlugin implements Plugin
{
    use ModuleFilamentPlugin;

    public function getModuleName(): string
    {
        return 'Inventory';
    }

    public function getId(): string
    {
        return 'inventory';
    }

    public function afterRegister(Panel $panel): void
    {
    }

    public function boot(Panel $panel): void
    {

    }
}
