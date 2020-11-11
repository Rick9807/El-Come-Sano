<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <title>Ingredientes</title>
</head>
<body>
    <h1>Añadir consejos</h1>

    @if (isset($consejo))
        <form action="{{ route('consejos.update', [$consejo]) }}" method="POST">
            @method('patch')
    @else
        <form action="{{ route('consejos.store') }}" method="POST"> 
    @endif
            @csrf
            <label for="platillo_id">Platillo</label>
            <select name="platillo_id">
                 @foreach ($platillos as $platillo)
                    <option value="{{ $platillo->id }}">{{ $platillo->plat_nombre }}</option>
                 @endforeach
            </select> <br> <br>

            <label for="ingrecons_contenido_nombre">Consejo</label>
            <textarea name="cons_contenido" value="{{ old('cons_contenido') ?? $consejo->cons_contenido ?? ''}}"></textarea> <br>
            @error('cons_contenido')
                <div class="alert alert-danger">{{ $message }}</div>
            @enderror <br>

            <label for=></label>

            <button type="submit">Enviar</button>
        </form>

</body>

</html>