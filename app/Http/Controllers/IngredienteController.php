<?php

namespace App\Http\Controllers;

use App\Models\Ingrediente;
use Illuminate\Http\Request;
use App\Http\Middleware\IngredienteEnUso;

class IngredienteController extends Controller
{

    public function __construct()
    {
        $this->middleware(IngredienteEnUso::class)->only('destroy');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$consulta = DB::table('ingredientes')->get();
        $consulta = Ingrediente::get();
        //dd($consulta);
        return view('ingredientes/ingredientesIndex', compact('consulta'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('ingredientes/ingredientesCreate');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Recibir datos
        //dd($request->all());

        //Validar datos
        $request->validate([
            'ingre_nombre' => 'required|string',
            'ingre_tipo' => 'required|string',
            //'ingre_marca' => 'required|string',
            'ingre_vega' => 'required|string|max:2|min:2',
            'ingre_cal' => 'required|numeric',
            'ingre_azucares' => 'required|numeric',
            'ingre_carbohidratos' => 'required|numeric',
            'ingre_colesterol' => 'required|numeric',
        ]);


        //Guardar en DB
        $request->merge(['ingre_marca' => $request->ingre_marca ?? '']);
        Ingrediente::create($request->all());

        //Redireccionar
        return redirect('/ingredientes');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ingrediente  $ingrediente
     * @return \Illuminate\Http\Response
     */
    public function show(Ingrediente $ingrediente)
    {
        return view('ingredientes/ingredienteShow', compact('ingrediente'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Ingrediente  $ingrediente
     * @return \Illuminate\Http\Response
     */
    public function edit(Ingrediente $ingrediente)
    {
        return view('ingredientes.ingredientesCreate', compact('ingrediente'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Ingrediente  $ingrediente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Ingrediente $ingrediente)
    {
        //Recibir datos
        //dd($request->all(), $request->)except('_method','_token');
        
        //Validar datos
        $request->validate([
            'ingre_nombre' => 'required|string',
            'ingre_tipo' => 'required|string',
            //'ingre_marca' => 'required|string',
            'ingre_vega' => 'required|string|max:2|min:2',
            'ingre_cal' => 'required|numeric',
            'ingre_azucares' => 'required|numeric',
            'ingre_carbohidratos' => 'required|numeric',
            'ingre_colesterol' => 'required|numeric',
        ]);

        //Guardar datos en BD
        Ingrediente::where('id', $ingrediente->id)->update($request->except('_method','_token'));

        return redirect()->route('ingredientes.show', [$ingrediente]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Ingrediente  $ingrediente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Ingrediente $ingrediente)
    {
        $ingrediente->delete();
        return redirect()->route('ingredientes.index');
    }
}
