<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->id();
            $table->string('us_nombre', 50);
            $table->string('us_apellido', 50);
            $table->integer('us_edad');
            $table->string('us_email', 80);
            $table->string('us_pass', 30);
            $table->date('us_date');
            $table->string('us_genero', 20);
            $table->string('plat_img', 100);
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
        Schema::dropIfExists('usuarios');
    }
}
