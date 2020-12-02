<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Platillo;
use App\Models\Ingrediente;

class PlatilloSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Platillo::factory()->times(10)->vegaSi()->has(Ingrediente::factory()->vegaSi()->count(3))->create();

        Platillo::factory()->times(10)->vegaNo()->has(Ingrediente::factory()->vegaNo()->count(3))->create();
    }
}
