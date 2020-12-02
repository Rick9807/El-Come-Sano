<?php

namespace Database\Factories;

use App\Models\Ingrediente;
use Illuminate\Database\Eloquent\Factories\Factory;

class IngredienteFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Ingrediente::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'ingre_nombre' => $this->faker->word(),
            'ingre_cal' => $this->faker->randomFloat(1,0,200),
            'ingre_tipo' => $this->faker->word(),
            'ingre_marca' => $this->faker->word(),
            //'ingre_vega' => $this->faker->lexify('??'),
            'ingre_azucares' => $this->faker->randomFloat(1,0,200),
            'ingre_carbohidratos' => $this->faker->randomFloat(1,0,200),
            'ingre_colesterol' => $this->faker->randomFloat(1,0,200),
        ];
    }

    public function vegaSi()
{
    return $this->state(function (array $attributes) {
        return [
            'ingre_vega' => 'Si',
        ];
    });
}

    public function vegaNo()
{
    return $this->state(function (array $attributes) {
        return [
            'ingre_vega' => 'No',
        ];
    });
}
}
