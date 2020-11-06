
@extends('layouts.blank')

@section('titulo')
    <h1>Agregar platillo</h1>
@endsection

@section('contenido')
    @if (isset($platillo))
        <form action="{{ route('platillos.update', [$platillo]) }}" method="POST">
            @method('patch')
    @else
        <form action="{{ route('platillos.store') }}" method="POST"> 
    @endif
        <!--<form action="/platillos" method="POST">-->
            @csrf
            <label for="plat_nombre">Nombre</label>
            <input type="text" name="plat_nombre" value="{{ old('plat_nombre') ?? $platillo->plat_nombre ?? ''}}"> <br>
            @error('plat_nombre')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="plat_cal">Calorias</label>
            <input type="number" step=0.01 name="plat_cal" value="{{ old('plat_cal') ?? $platillo->plat_cal ?? ''}}"> <br>
            @error('plat_cal')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="plat_azucares">Azucares</label>
            <input type="number" step=0.01 name="plat_azucares" value="{{ old('plat_azucares') ?? $platillo->plat_azucares ?? ''}}"> <br>
            @error('plat_azucares')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="plat_desc">Descripcion</label>
            <input type="text" name="plat_desc" value="{{ old('plat_desc') ?? $platillo->plat_desc ?? ''}}"> <br>

            <p>Vegano</p>
            <input type="radio" id="si_vegano" name="plat_vegano" value="Si" {{ old('plat_vegano') == 'Si' ? 'checked' : '' }} {{ isset($platillo) && $platillo->plat_vegano == 'Si' ? 'checked' : ''}}>
            <label for="si_vegano">Si</label>
            <input type="radio" id="no_vegano" name="plat_vegano" value="No" {{ old('plat_vegano') == 'No' ? 'checked' : '' }} {{ isset($platillo) && $platillo->plat_vegano == 'No' ? 'checked' : ''}}>
            <label for="no_vegano">No</label> <br>
            @error('plat_vega')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="plat_carbohidratos">Carbohidratos</label>
            <input type="number" step=0.01 name="plat_carbohidratos" value="{{ old('plat_carbohidratos') ?? $platillo->plat_carbohidratos ?? ''}}"> <br>
            @error('plat_carbohidratos')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="plat_colesterol">Colesterol</label>
            <input type="number" step=0.01 name="plat_colesterol"value="{{ old('plat_colesterol') ?? $platillo->plat_colesterol ?? ''}}"> <br>
            @error('plat_colesterol')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            @if (isset($consulta))
                <label for="plat_ingredientes">Ingredientes</label><br>
                @foreach ($consulta as $ingrediente)
                    <input type="checkbox" id="{{$ingrediente->id}}" name="plat_ingredientes[]" value="{{$ingrediente->id}}">
                    <label for="{{$ingrediente->id}}">{{$ingrediente->ingre_nombre}}</label><br>
                @endforeach
            @endif

            <br>
            <button type="submit" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Enviar</button>
        </form>

        <br>
        <a href="{{ route('platillos.index') }}" class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm'>Cancelar</a>
@endsection