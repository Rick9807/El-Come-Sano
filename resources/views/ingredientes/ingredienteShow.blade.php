<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width-devise-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
    <title>Ingredientes</title>
</head>
<body>
    <h1>Ingrediente</h1>
    <a href='/ingredientes'>Regresar</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Marca</th>
            <th>Vegano</th>
            <th>Azucares</th>
            <th>Calorias</th>
            <th>Carbhidratos</th>
            <th>Colesterol</th>
        </tr>
        
        <tr>
            <td>{{ $ingrediente->ingre_id }}</td>
            <td>{{ $ingrediente->ingre_nombre }}</td>
            <td>{{ $ingrediente->ingre_tipo }}</td>                
            <td>{{ $ingrediente->ingre_marca }}</td>
            <td>{{ $ingrediente->ingre_vega }}</td>
            <td>{{ $ingrediente->ingre_azucares }}</td>
            <td>{{ $ingrediente->ingre_cal }}</td>
            <td>{{ $ingrediente->ingre_carbohidratos }}</td>
            <td>{{ $ingrediente->ingre_colesterol }}</td>
        </tr>

    </table>

</body>

</html>