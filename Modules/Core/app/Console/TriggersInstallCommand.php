<?php

namespace Modules\Core\Console;

use Illuminate\Console\Command;

use function Laravel\Prompts\text;
use function Modules\Core\Support\utils;

class TriggersInstallCommand extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'core:triggers:install {table?}';

    /**
     * The console command description.
     */
    protected $description = 'Install triggers for a given table.';

    /**
     * Create a new command instance.
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $table = $this->argument('table') ?? text('Enter the table name to install triggers for', 'e.g users', required: true);
        $this->alert("Installing triggers for table: $table");
        // Immutable check
        //        $this->info("Installing immutable check triggers for table: $table");
        //        utils()->installImmutableCheckTrigger($table);
        //        $this->info("Immutable check trigger has been installed.");
        // Code triggers
        $this->info("Installing code triggers for table: $table");
        utils()->installCodeTriggers($table);
        $this->info('Code triggers have been installed.');
        // Audit triggers
        //        $this->info("Installing audit log triggers for table: $table");
        //        utils()->installAuditLogTriggers($table);
        //        $this->info("Audit Log triggers have been installed.");

        // If table is user, install profile triggers
        /*if ($table === 'users') {
            $this->info("Installing users auto profile creation triggers");
            utils()->installUserProfileTriggers();
            $this->info("Audit Log triggers have been installed.");
        }*/

        $this->alert("Triggers re-installed for table: $table");

        return self::SUCCESS;
    }
}
