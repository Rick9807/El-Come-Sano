<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Ingrediente;

class IngredienteEnUso
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

        $Ingrediente_id = substr($request->path(), strpos($request->path(), "/") + 1);
        
        $ingrediente = Ingrediente::where('id', '=', $Ingrediente_id )->first();

        if ( count($ingrediente->platillos) > 0 ){
            return redirect($request->path())->with(['mensaje'=>'El Ingrediente esta en uso. No se puede eliminar.']) ;
        }

        //return $next($request);
    }
}
