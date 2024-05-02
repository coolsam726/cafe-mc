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
        Schema::disableForeignKeyConstraints();
        Schema::table('recipes', function (Blueprint $table) {
            $table->dropForeign(['product_id']);
        });
        Schema::enableForeignKeyConstraints();
        Schema::table('recipes', function (Blueprint $table) {
            $table->renameColumn('product_id', 'article_id');
            $table->renameIndex('recipes_product_id_foreign', 'recipes_article_id_foreign');
        });
        Schema::table('recipes', function (Blueprint $table) {
            $table->foreign('article_id')->references('id')->on('articles')->cascadeOnDelete();
            $table->foreignId('product_id')->nullable()->constrained('products')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::table('recipes', function (Blueprint $table) {
            $table->dropConstrainedForeignId('product_id');
        });
        Schema::table('recipes', function (Blueprint $table) {
            $table->dropForeign(['article_id']);
            $table->renameColumn('article_id', 'product_id');
            $table->renameIndex('recipes_article_id_foreign', 'recipes_product_id_foreign');
        });
        Schema::enableForeignKeyConstraints();
        Schema::table('recipes', function (Blueprint $table) {
            $table->foreign('product_id')->references('id')->on('articles')->cascadeOnDelete();
        });
    }
};
