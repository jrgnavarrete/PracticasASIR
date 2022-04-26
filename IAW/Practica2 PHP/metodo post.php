<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario get</title>
</head>
<body>
    <form action="guada_datos.php" method="post"> 
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre"> <br>
        <label for="edad">Edad:</label>
        <input type="text" id="edad" name="edad"> <br>
        <input type="submit" name="validar" id="validar" value="Enviar">
    </form>

</body>
</html>