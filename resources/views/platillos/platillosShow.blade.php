
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
        </tr>
@endsection



@section('tabla_extra')
<div class="container-fluid">
   <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Consejos</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Consejo</th>
                        </tr>
                    </thead>
                        <!--<tfoot>
                            @yield('tabla_cabecera')
                        </tfoot>-->
                    <tbody>
                        <tr>
                            @foreach ($platillo->consejo as $consejo)
                                <td> {{ $consejo->id }} </td>   
                                <td> {{ $consejo->cons_contenido }} </td>  
                            @endforeach
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
