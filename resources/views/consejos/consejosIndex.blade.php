<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <title>Ingredientes</title>
</head>
<body>
    <h1>Listado de consejos</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Consejo</th>
                <th>Platillo</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($consejos as $consejo)
                <tr>
                    <td>{{ $consejo->id }}</td>
                    <td>{{ $consejo->cons_contenido }}</td>
                    <td>{{ $consejo->platillo->plat_nombre }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>