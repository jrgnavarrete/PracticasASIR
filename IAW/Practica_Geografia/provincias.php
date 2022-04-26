<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elección de C.A.</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <?php
        include 'configBBDD.php'; //Incluimos datos de conexión

        $conexion = mysqli_connect(localhost, admin, password, geografia) or die ("Conexión con base de datos fallida.");
        $consulta = "select provincias.nombre from provincias, comunidades where provincias.id_comunidad = comunidades.id_comunidad && '{$_GET['comunidades']}' = comunidades.nombre order by nombre;";
        $resultado = mysqli_query($conexion, $consulta) or die ("Consulta a la base de datos fallida.");

        if (mysqli_num_rows($resultado) > 0) { //Si la tabla tiene datos...
    ?>
            <form action=localidades.php>
                <label for="provincias">Elija la provincia deseada</label>
                <select name=provincias>
                    <?php
                        while ($fila = mysqli_fetch_assoc ($resultado)){
                            echo "<option value='{$fila["nombre"]}'>{$fila["nombre"]}</option>";
                        }                    
                    ?>
                </select>
                <button> Buscar localidades </button>
            </form>
    <?php
        } else {
            echo "No hay datos actualmente en la base de datos.";
        }    
    ?>
</body>
</html>