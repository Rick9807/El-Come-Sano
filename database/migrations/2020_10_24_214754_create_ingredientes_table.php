<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIngredientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ingredientes', function (Blueprint $table) {
            $table->id();
            $table->string('ingre_nombre', 40);
            $table->float ('ingre_cal', 8, 2);
            $table->string('ingre_tipo', 40);
            $table->string('ingre_marca', 40)->nullable();
            $table->string('ingre_vega', 5);
            $table->float('ingre_azucares', 8, 2);
            $table->float('ingre_carbohidratos', 8, 2);
            $table->float('ingre_colesterol', 8, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ingredientes');
    }
}
