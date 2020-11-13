
@extends('layouts.table')

@section('titulo')
    <h1>Platillo</h1>
    <a href={{ action([\App\Http\Controllers\PlatilloController::class, 'index']) }} class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Regresar</a>
    <a href="{{ route('platillos.edit', [$platillo->id]) }}" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Editar platillo</a>
    <br><br>
    <form action="{{ route('platillos.destroy', [$platillo]) }}", method='POST'>
        @method('DELETE')
        @csrf
        <button type="submit" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Eliminar</button>
    </form>
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
            <th>Ingredientes</th>
            <th>Consejos</th>
        </tr>
@endsection

@section('tabla_contenido')
        <tr>
            <td>{{ $platillo->id }}</td>
            <td>{{ $platillo->plat_nombre }}</td>
            <td>{{ $platillo->plat_cal }}</td>
            <td>{{ $platillo->plat_azucares }}</td>
            <td>{{ $platillo->plat_desc }}</td>
            <td>{{ $platillo->plat_vegano }}</td>
            <td>{{ $platillo->plat_carbohidratos }}</td>
            <td>{{ $platillo->plat_colesterol }}</td>
            <td>
                @foreach ($platillo->ingredientes as $ingrediente)
                <a href="/ingredientes/{{$ingrediente->id}}"> {{ $ingrediente->ingre_nombre }}</a> <br>
                @endforeach
            </td>
            <td>
                @foreach ($platillo->consejo as $consejo)
                    {{ $consejo->cons_contenido }} <br>
                @endforeach
            </td>
        </tr>
@endsection
