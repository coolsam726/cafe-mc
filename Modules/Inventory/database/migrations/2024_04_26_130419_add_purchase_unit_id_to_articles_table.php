<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('articles', function (Blueprint $table) {
            $table->renameColumn('derived_unit_id', 'storage_unit_id');
            $table->foreignId('purchase_unit_id')->nullable()->constrained('derived_units')->nullOnDelete();
            $table->decimal('unit_cost', 10, 2)->default(0.00);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('articles', function (Blueprint $table) {
            $table->renameColumn('storage_unit_id', 'derived_unit_id');
            $table->dropConstrainedForeignId('purchase_unit_id');
            $table->dropColumn('unit_cost');
        });
    }
};
