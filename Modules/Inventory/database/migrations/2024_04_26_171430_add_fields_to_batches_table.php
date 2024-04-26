<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

use function Modules\Core\Support\core;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('batches', function (Blueprint $table) {
            $table->team('id');
            $table->nullableMorphs('stockable');
            $table->renameColumn('comments', 'narration');
            $table->decimal('initial_quantity', 20, 8)->after('comments')->nullable();
            $table->decimal('current_quantity', 20, 8)->after('initial_quantity')->nullable();
            $table->date('manufacture_date')->nullable();
            $table->date('expiry_date')->nullable();
            $table->audit();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('batches', function (Blueprint $table) {
            $table->dropColumn(core()::TEAM_COLUMN);
            $table->dropMorphs('stockable');
            $table->renameColumn('narration', 'comments');
            $table->dropColumn('initial_quantity');
            $table->dropColumn('current_quantity');
            $table->dropAudit();
        });
    }
};
