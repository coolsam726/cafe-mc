<?php

namespace Modules\Production\Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class RecipeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     */
    protected $model = \Modules\Production\Models\Recipe::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        return [];
    }
}

