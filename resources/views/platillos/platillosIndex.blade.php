@extends('layouts.table')

@section('titulo')
    <h1>Platillos</h1>
    <a href='/platillos/create' class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Agregar nuevo platillo</a>
@endsection

@section('tabla_cabecera')
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Calorias</th>
        <th>Azucares</th>
        <th>Descripcion</th>
        <th>Vegano</th>
        <th>Carbohidratos</th>
        <th>Colesterol</th>
    </tr>
@endsection

@section('tabla_contenido')

    @foreach ($consulta as $platillo)
        <tr>
            <td>{{ $platillo->id }}</td>
            <td> <a href="/platillos/{{$platillo->id}}"> {{ $platillo->plat_nombre }}</a> </td>
            <td>{{ $platillo->plat_cal }}</td>
            <td>{{ $platillo->plat_azucares }}</td>
            <td>{{ $platillo->plat_desc }}</td>
            <td>{{ $platillo->plat_vegano }}</td>
            <td>{{ $platillo->plat_carbohidratos }}</td>
            <td>{{ $platillo->plat_colesterol }}</td>
        </tr>
    @endforeach

@endsection
