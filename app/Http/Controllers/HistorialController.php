<?php

namespace App\Http\Controllers;

use App\Models\Historial;
use Illuminate\Http\Request;

class HistorialController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'his_peso_inicial' => 'required|numeric',
            'his_peso_actual' => 'required|numeric',
            'his_altura' => 'required|numeric',
            'his_imc_inicial' => 'required|numeric',
            'his_imc_actual' => 'required|numeric',
            'his_ejerc' => 'required|string',
            'his_vegano' => 'required|string',
            'his_diabetes' => 'required|string',
        ]);

        //$request->merge(['his_marca' => $request->his_marca ?? '']);
        Historial::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Historial  $historial
     * @return \Illuminate\Http\Response
     */
    public function show(Historial $historial)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Historial  $historial
     * @return \Illuminate\Http\Response
     */
    public function edit(Historial $historial)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Historial  $historial
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Historial $historial)
    {
        $request->validate([
            'his_peso_inicial' => 'required|numeric',
            'his_peso_actual' => 'required|numeric',
            'his_altura' => 'required|numeric',
            'his_imc_inicial' => 'required|numeric',
            'his_imc_actual' => 'required|numeric',
            'his_ejerc' => 'required|string',
            'his_vegano' => 'required|string',
            'his_diabetes' => 'required|string',
        ]);

        Historial::where('id', $historial->id)->update($request->except('_method','_token'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Historial  $historial
     * @return \Illuminate\Http\Response
     */
    public function destroy(Historial $historial)
    {
        $historial->delete();
    }
}
