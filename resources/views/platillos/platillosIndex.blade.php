<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Platillos</title>
</head>
<body>
    <h1>Platillos</h1>
    <a href='/platillos/create'>Agregar nuevo platillo</a>

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

    </table>

</body>

</html>