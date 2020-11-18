<?php

namespace App\Http\Controllers;

use App\Models\Consejo;
use Illuminate\Http\Request;
use App\Models\Platillo;

class ConsejoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $consejos = Consejo::all();
        
        //dd($consejos[0]->platillo);
        return view('consejos.consejosIndex', compact('consejos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $platillos = Platillo::all();
        return view('consejos.consejosCreate', compact('platillos'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Validar datos
        $request->validate([
            'cons_contenido' => 'required|string|min:3|max:255',
        ]);

        $consejo = New Consejo();
        $consejo->cons_contenido = $request->cons_contenido;
        $consejo->platillo_id = $request->platillo_id;

        //Guardar en DB
        $consejo->save();

        //Redireccionar
        return redirect('/consejos');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Consejo  $consejo
     * @return \Illuminate\Http\Response
     */
    public function show(Consejo $consejo)
    {
        return view('consejos/consejoShow', compact('consejo'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Consejo  $consejo
     * @return \Illuminate\Http\Response
     */
    public function edit(Consejo $consejo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Consejo  $consejo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Consejo $consejo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Consejo  $consejo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Consejo $consejo)
    {
        $consejo->delete();
        return redirect()->route('platillos.index');
    }
}
