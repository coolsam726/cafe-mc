<?php

namespace Modules\Production\Filament;

use Coolsam\Modules\Concerns\ModuleFilamentPlugin;
use Filament\Contracts\Plugin;
use Filament\Panel;

class ProductionPlugin implements Plugin
{
    use ModuleFilamentPlugin;

    public function getModuleName(): string
    {
        return 'Production';
    }

    public function getId(): string
    {
        return 'production';
    }

    public function boot(Panel $panel): void
    {
        // TODO: Implement boot() method.
    }
}
