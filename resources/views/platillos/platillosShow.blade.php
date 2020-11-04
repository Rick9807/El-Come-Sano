<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Platillos</title>
</head>
<body>
    <h1>Platillo</h1>
    <!--<a href="/platillos/{{ $platillo->id }}/edit">Editar platillo</a> -->
    <a href={{ action([\App\Http\Controllers\PlatilloController::class, 'index']) }}>Regresar</a>
    <a href="{{ route('platillos.edit', [$platillo->id]) }}">Editar platillo</a>

    <form action="{{ route('platillos.destroy', [$platillo]) }}", method='POST'>
        @method('DELETE')
        @csrf
        <button type="submit">Eliminar</button>
    </form>

    <table>
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
        
        <tr>
            <td>{{ $platillo->id }}</td>
            <td>{{ $platillo->plat_nombre }}</td>
            <td>{{ $platillo->plat_cal }}</td>
            <td>{{ $platillo->plat_azucares }}</td>
            <td>{{ $platillo->plat_desc }}</td>
            <td>{{ $platillo->plat_vegano }}</td>
            <td>{{ $platillo->plat_carbohidratos }}</td>
            <td>{{ $platillo->plat_colesterol }}</td>
        </tr>

    </table>

</body>

</html>