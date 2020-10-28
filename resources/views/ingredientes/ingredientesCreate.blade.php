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
        <label for="ingre_nombre">Nombre</label>
        <input type="text" name="ingre_nombre"> <br><br>

        <label for="ingre_tipo">Tipo</label>
        <input type="text" name="ingre_tipo"> <br><br>

        <label for="ingre_marca">Marca</label>
        <input type="text" name="ingre_marca"> <br>

        <p>Vegano</p>
        <input type="radio" id="si_vegano" name="ingre_vega" value="Si">
        <label for="si_vegano">Si</label>
        <input type="radio" id="no_vegano" name="ingre_vega" value="No">
        <label for="no_vegano">No</label> <br><br>

        <label for="ingre_cal">Calorias</label>
        <input type="number" step=0.01 name="ingre_cal"> <br><br>

        <label for="ingre_azucares">Azucares</label>
        <input type="number" step=0.01 name="ingre_azucares"> <br><br>

        <label for="ingre_carbohidratos">Carbohidratos</label>
        <input type="number" step=0.01 name="ingre_carbohidratos"> <br><br>

        <label for="ingre_colesterol">Colesterol</label>
        <input type="number" step=0.01 name="ingre_colesterol"> <br><br>

        <br>
        <button type="submit">Enviar</button>
    </form>
</body>

</html>