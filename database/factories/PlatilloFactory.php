<?php

namespace Database\Factories;

use App\Models\Platillo;
use App\Models\Ingrediente;
use Illuminate\Database\Eloquent\Factories\Factory;

class PlatilloFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Platillo::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'plat_nombre' => $this->faker->word(),
            'plat_cal' => $this->faker->randomFloat(1,500,1500),
            'plat_desc' => $this->faker->paragraph(),
            //'plat_vegano' => $this->faker->lexify('??'),
            'plat_azucares' => $this->faker->randomFloat(1,500,1500),
            'plat_carbohidratos' => $this->faker->randomFloat(1,500,1500),
            'plat_colesterol' => $this->faker->randomFloat(1,500,1500),
        ];
    }

    public function vegaSi()
    {
        return $this->state(function (array $attributes) {
            return [
                'plat_vegano' => 'Si',
            ];
        });
    }

    public function vegaNo()
    {
        return $this->state(function (array $attributes) {
            return [
                'plat_vegano' => 'No',
            ];
        });
    }
}
