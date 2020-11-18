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
    <h1>Consejo</h1>
    <a href={{ action([\App\Http\Controllers\ConsejoController::class, 'index']) }}>Regresar</a>

    <form action="{{ route('consejos.destroy', [$consejo]) }}", method='POST'>
        @method('DELETE')
        @csrf
        <button type="submit">Eliminar</button>
    </form>
@endsection

@section('tabla_cabecera')
        <tr>
            <th>ID</th>
            <th>Consejo<th>
        </tr>
@endsection

@section('tabla_contenido')
        <tr>
            <td>{{ $consejo->id }}</td>
            <td>{{ $consejo->cons_contenido }}</td>
        </tr>
@endsection