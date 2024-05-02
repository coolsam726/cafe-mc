<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Modules\Production\Models\RecipeItem;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('recipe_items', function (Blueprint $table) {
            $table->dropForeign(['derived_unit_id']);
        });
        Schema::table('recipe_items', function (Blueprint $table) {
            $table->renameColumn('derived_unit_id', 'unit_id');
            $table->renameColumn('position','sort');
        });
        Schema::table('recipe_items', function (Blueprint $table) {
            $table->foreign('unit_id')->references('id')->on('derived_units')->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('recipe_items', function (Blueprint $table) {
            $table->renameColumn('sort','position');
            $table->dropForeign(['unit_id']);
        });
        Schema::table('recipe_items', function (Blueprint $table) {
            $table->renameColumn('unit_id', 'derived_unit_id');
        });
        Schema::table('recipe_items', function (Blueprint $table) {
            $table->foreign('derived_unit_id')->references('id')->on('derived_units')->restrictOnDelete();
        });
    }
};
