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
    <form action="/ingredientes" method="POST">
        @csrf
        <button type="submit">Enviar</button>
    </form>
</body>

</html>