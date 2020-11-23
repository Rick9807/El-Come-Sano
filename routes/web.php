<?php

use Illuminate\Support\Facades\Route;
use App\Models\Ingrediente;
use App\Models\Platillo;
use App\Http\Controllers\IngredienteController;
use App\Http\Controllers\PlatilloController;
use App\Http\Controllers\HistorialController;
use App\Http\Controllers\ConsejoController;

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
  $platillos = Platillo::get();
  return view('welcome', compact('platillos'));
});

Route::get('/inicio', function () {
  $consulta = Ingrediente::get();

  return view('ingredientes.inicio', compact('consulta'));
});

//CRUD ingredientes
Route::resource('ingredientes', IngredienteController::class)->middleware(['auth:sanctum']);
Route::resource('platillos', PlatilloController::class)->middleware(['auth:sanctum']);
Route::resource('historiales', HistorialController::class)->middleware(['auth:sanctum']);
Route::resource('consejos', ConsejoController::class)->middleware(['auth:sanctum']);

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

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return redirect('/ingredientes');
})->name('dashboard');
