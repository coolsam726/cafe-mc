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
        Schema::dropIfExists('outlet_product');
        $this->down();
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->code(uniquePerTeam: true);
            $table->team();
            $table->string('name');
            $table->boolean('is_direct_item')->default(false);
            $table->foreignId('article_id')->nullable()->constrained('articles')->restrictOnDelete();
            $table->decimal('suggested_sale_price', 10)->default(0);
            $table->foreignId('migrated_article_id')->nullable();
            $table->audit();
            $table->active();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
