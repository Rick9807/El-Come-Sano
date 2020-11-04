<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Platillos</title>
</head>
<body>
    <h1>Agregar platillo</h1>

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
            <input type="radio" id="si_vegano" name="plat_vega" value="Si" {{ old('plat_vega') == 'Si' ? 'checked' : '' }} {{ isset($platillo) && $platillo->plat_vega == 'Si' ? 'checked' : ''}}>
            <label for="si_vegano">Si</label>
            <input type="radio" id="no_vegano" name="plat_vega" value="No" {{ old('plat_vega') == 'No' ? 'checked' : '' }} {{ isset($platillo) && $platillo->plat_vega == 'No' ? 'checked' : ''}}>
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

            <br>
            <button type="submit">Enviar</button>
        </form>

        <a href="{{ route('platillos.index') }}">Cancelar</a>
</body>

</html>