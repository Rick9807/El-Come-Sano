@extends('layouts.table')

<!--<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ingredientes</title>
</head>
<body> -->
@section('titulo')
    <h1>Ingrediente</h1>
    <!--<a href="/ingredientes/{{ $ingrediente->id }}/edit">Editar ingrediente</a> -->
    <a href={{ action([\App\Http\Controllers\IngredienteController::class, 'index']) }}>Regresar</a>
    <a href="{{ route('ingredientes.edit', [$ingrediente->id]) }}">Editar ingrediente</a>

    <form action="{{ route('ingredientes.destroy', [$ingrediente]) }}", method='POST'>
        @method('DELETE')
        @csrf
        <button type="submit">Eliminar</button>
    </form>
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
        <tr>
            <td>{{ $ingrediente->id }}</td>
            <td>{{ $ingrediente->ingre_nombre }}</td>
            <td>{{ $ingrediente->ingre_tipo }}</td>                
            <td>{{ $ingrediente->ingre_marca }}</td>
            <td>{{ $ingrediente->ingre_vega }}</td>
            <td>{{ $ingrediente->ingre_azucares }}</td>
            <td>{{ $ingrediente->ingre_cal }}</td>
            <td>{{ $ingrediente->ingre_carbohidratos }}</td>
            <td>{{ $ingrediente->ingre_colesterol }}</td>
        </tr>
@endsection

<!--</body>

</html> -->