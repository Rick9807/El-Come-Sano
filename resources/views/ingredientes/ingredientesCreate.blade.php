<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Ingredientes</title>
</head>
<body>
    <h1>Agregar ingrediente</h1>

    @if (isset($ingrediente))
        <form action="{{ route('ingredientes.update', [$ingrediente]) }}" method="POST">
            @method('patch')
    @else
        <form action="{{ route('ingredientes.store') }}" method="POST"> 
    @endif
        <!--<form action="/ingredientes" method="POST">-->
            @csrf
            <label for="ingre_nombre">Nombre</label>
            <input type="text" name="ingre_nombre" value="{{ old('ingre_nombre') ?? $ingrediente->ingre_nombre ?? ''}}"> <br>
            @error('ingre_nombre')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="ingre_tipo">Tipo</label>
            <input type="text" name="ingre_tipo" value="{{ old('ingre_tipo') ?? $ingrediente->ingre_tipo ?? ''}}"> <br>
            @error('ingre_tipo')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="ingre_marca">Marca</label>
            <input type="text" name="ingre_marca" value="{{ old('ingre_marca') ?? $ingrediente->ingre_marca ?? ''}}"> <br>

            <p>Vegano</p>
            <input type="radio" id="si_vegano" name="ingre_vega" value="Si" {{ old('ingre_vega') == 'Si' ? 'checked' : '' }} {{ isset($ingrediente) && $ingrediente->ingre_vega == 'Si' ? 'checked' : ''}}>
            <label for="si_vegano">Si</label>
            <input type="radio" id="no_vegano" name="ingre_vega" value="No" {{ old('ingre_vega') == 'No' ? 'checked' : '' }} {{ isset($ingrediente) && $ingrediente->ingre_vega == 'No' ? 'checked' : ''}}>
            <label for="no_vegano">No</label> <br>
            @error('ingre_vega')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="ingre_cal">Calorias</label>
            <input type="number" step=0.01 name="ingre_cal" value="{{ old('ingre_cal') ?? $ingrediente->ingre_cal ?? ''}}"> <br>
            @error('ingre_cal')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="ingre_azucares">Azucares</label>
            <input type="number" step=0.01 name="ingre_azucares" value="{{ old('ingre_azucares') ?? $ingrediente->ingre_azucares ?? ''}}"> <br>
            @error('ingre_azucares')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="ingre_carbohidratos">Carbohidratos</label>
            <input type="number" step=0.01 name="ingre_carbohidratos" value="{{ old('ingre_carbohidratos') ?? $ingrediente->ingre_carbohidratos ?? ''}}"> <br>
            @error('ingre_carbohidratos')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for="ingre_colesterol">Colesterol</label>
            <input type="number" step=0.01 name="ingre_colesterol"value="{{ old('ingre_colesterol') ?? $ingrediente->ingre_colesterol ?? ''}}"> <br>
            @error('ingre_colesterol')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <br>
            <button type="submit">Enviar</button>
        </form>

        <a href="{{ route('ingredientes.index') }}">Cancelar</a>
</body>

</html>