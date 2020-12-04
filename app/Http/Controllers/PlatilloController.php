<?php

namespace App\Http\Controllers;

use App\Models\Platillo;
use App\Models\Ingrediente;
use Illuminate\Http\Request;

class PlatilloController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $consulta = Platillo::get();
        return view('platillos/platillosIndex', compact('consulta'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $ingredientes = Ingrediente::orderby('ingre_nombre')->get();
        return view('platillos/platillosCreate', compact('ingredientes'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //dd($request->all());
        $request->validate([
            'plat_nombre' => 'required|string',
            'plat_vegano' => 'required|string|max:2|min:2',
            'plat_desc' => 'required|string',
            'plat_cal' => 'required|numeric',
            'plat_azucares' => 'required|numeric',
            'plat_carbohidratos' => 'required|numeric',
            'plat_colesterol' => 'required|numeric',
        ]);
        $platillo = Platillo::create($request->all());
        $platillo->ingredientes()->attach($request->ingrediente_id);  //Aquí se agregan los registros a la tabla "pivote (ingrediente_platillo".

        return redirect('/platillos');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Platillo  $platillo
     * @return \Illuminate\Http\Response
     */
    public function show(Platillo $platillo)
    {
        return view('platillos/platillosShow', compact('platillo'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Platillo  $platillo
     * @return \Illuminate\Http\Response
     */
    public function edit(Platillo $platillo)
    {
        $ingredientes = Ingrediente::get();
        return view('platillos.platillosCreate', compact('platillo', 'ingredientes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Platillo  $platillo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Platillo $platillo)
    {
        $request->validate([
            'plat_nombre' => 'required|string',
            'plat_desc' => 'required|string',
            'plat_vegano' => 'required|string|max:2|min:2',
            'plat_cal' => 'required|numeric',
            'plat_azucares' => 'required|numeric',
            'plat_carbohidratos' => 'required|numeric',
            'plat_colesterol' => 'required|numeric',
        ]);

        Platillo::where('id', $platillo->id)->update($request->except('_method','_token','ingrediente_id'));

        $platillo->ingredientes()->sync($request->ingrediente_id);

        return redirect()->route('platillos.show', [$platillo]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Platillo  $platillo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Platillo $platillo)
    {
        $platillo->delete();
        return redirect()->route('platillos.index');
    }
}
