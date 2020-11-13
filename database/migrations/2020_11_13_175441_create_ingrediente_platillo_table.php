<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIngredientePlatilloTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ingrediente_platillo', function (Blueprint $table) {
            $table->foreignId('platillo_id')->references('id')->on('platillos')->onDelete('cascade');
            $table->foreignId('ingrediente_id')->constrained();
            //$table->primary(['platillo_id', 'ingrediente_id']);
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
        Schema::dropIfExists('ingrediente_platillo');
    }
}
