@extends('layouts.app')

@section('titulo')
    <h1>Ingredientes</h1>
@endsection

@section('tabla_cabecera')
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Marca</th>
            <th>Vegano</th>
            <th>Azucares</th>
            <th>Calorias</th>
            <th>Carbohidratos</th>
            <th>Colesterol</th>
        </tr>

@endsection

@section('tabla_contenido')
        @foreach ($consulta as $ingrediente)
            <tr>
                <td>{{ $ingrediente->id }}</td>
                <td> <a href="/ingredientes/{{$ingrediente->id}}"> {{ $ingrediente->ingre_nombre }}</a> </td>
                <td>{{ $ingrediente->ingre_tipo }}</td>
                <td>{{ $ingrediente->ingre_marca }}</td>
                <td>{{ $ingrediente->ingre_vega }}</td>
                <td>{{ $ingrediente->ingre_azucares }}</td>
                <td>{{ $ingrediente->ingre_cal }}</td>
                <td>{{ $ingrediente->ingre_carbohidratos }}</td>
                <td>{{ $ingrediente->ingre_colesterol }}</td>
            </tr>
        @endforeach
     
@endsection