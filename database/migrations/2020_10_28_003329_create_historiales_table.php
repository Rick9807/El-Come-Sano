<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHistorialesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historiales', function (Blueprint $table) {
            $table->id();
            $table->foreignId('us_id')->references('id')->on('usuarios');
            $table->float ('his_peso_inicial', 8, 2);
            $table->float ('his_peso_actual', 8, 2);
            $table->float ('his_altura', 8, 2);
            $table->float ('his_imc_inicial', 8, 2);
            $table->float ('his_imc_actual', 8, 2);
            $table->string('his_ejerc', 30);
            $table->string('his_vegano', 5);
            $table->string('his_diabetes', 5);
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
        Schema::dropIfExists('historiales');
    }
}
