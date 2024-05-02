<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Laravel\Reverb\Loggers\Log;
use Modules\Core\Models\Team;
use Modules\Core\Support\Core;
use Modules\Inventory\Models\Article;
use Modules\Production\Models\Product;
use Modules\Production\Models\Recipe;
use function Laravel\Prompts\progress;
use function React\Promise\Timer\timeout;

class ProductsMigrate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:products:migrate';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Move Products from Articles to FinishedProducts';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $recipes = DB::table(Recipe::getModel()->getTable())->get();
        progress('Migrating Recipe Products from Article to Product',$recipes, function ($recipe) {
            /**
             * @var Article $article
             * @var Recipe $recipe
             */
            $recipe = Recipe::query()->withoutGlobalScopes()->find($recipe->id);
            $article = Article::query()->withoutGlobalScope('team')->find($recipe->article_id);
            if ($article && DB::table('products')->where('migrated_article_id', $article->id)->where(Core::TEAM_COLUMN, $recipe->{Core::TEAM_COLUMN})->doesntExist()) {
                $product = new Product([
                    'migrated_article_id' => $article->id,
                    Core::TEAM_COLUMN => $recipe->{Core::TEAM_COLUMN},
                    'name' => $article->name,
                    'is_active' => $article->enabled,
                    'is_direct_item' => false,
                    'suggested_sale_price' => $recipe->calculated_sale_price ?? 0.0,
                    'article_id' => null,
                ]);
                $product->generateCode();
                $product->saveOrFail();
                // Update recipe
                $recipe->update(['product_id' => $product->id]);
            }
        });
        return static::SUCCESS;
    }
}
