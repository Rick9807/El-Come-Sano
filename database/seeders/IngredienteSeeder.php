<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Ingrediente;

class IngredienteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Ingrediente::factory()->times(3)->vegaSi()->create();

        Ingrediente::factory()->times(3)->vegaNo()->create();
    }
}
