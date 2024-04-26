<?php

namespace Modules\Procurement\Filament;

use Coolsam\Modules\Concerns\ModuleFilamentPlugin;
use Filament\Contracts\Plugin;
use Filament\Panel;

class ProcurementPlugin implements Plugin
{
    use ModuleFilamentPlugin;

    public function getModuleName(): string
    {
        return 'Procurement';
    }

    public function getId(): string
    {
        return 'procurement';
    }

    public function boot(Panel $panel): void
    {
        // TODO: Implement boot() method.
    }
}
