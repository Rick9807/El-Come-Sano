<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IngredienteController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//CRUD ingredientes
Route::resource('ingredientes', IngredienteController::class);


/*Route::get('/ingredientes', function () {
  
});

Route::get('/ingredientes/create', function() {
  return view('ingredientes/ingredientesCreate');
});

//Guardar ingrediente
Route::post('/ingredientes', function(Request $request) {
  //Recibir datos
  //Valido datos
  //Guardar en DB
  //Redireccionar
  return redirect('/ingredientes');
});


//Listado ingredientes
Route::get('/ingredientes', [IngredienteController::class, 'index']);
//Formulario nuevo ingredientes
Route::get('/ingredientes/create', [IngredienteController::class, 'create']);
//Detalle de ingrediente. Show
Route::get('/ingredientes/{ingrediente}', [IngredienteController::class, 'show']);

*/

//Formulario edición

//Actualizar registro

//Eliminar ingrediente