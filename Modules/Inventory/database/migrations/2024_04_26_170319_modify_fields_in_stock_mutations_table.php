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
        Schema::table('stock_mutations', function (Blueprint $table) {
            $table->renameColumn('amount', 'new_quantity');
            $table->renameColumn('prev_amount', 'prev_quantity');
            $table->foreignId('location_id')->nullable()->constrained('depots');
            $table->foreignId('batch_id')->after('reference_id')->nullable()->constrained('batches')->nullOnDelete();
            $table->audit();
            $table->team();
            $table->renameColumn('description', 'narration');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('stock_mutations', function (Blueprint $table) {
            $table->renameColumn('new_quantity', 'amount');
            $table->renameColumn('prev_quantity', 'prev_amount');
            $table->dropConstrainedForeignId('location_id');
            $table->dropConstrainedForeignId('batch_id');
            $table->dropAudit();
            $table->dropTeam();
            $table->renameColumn('narration', 'description');
        });
    }
};
