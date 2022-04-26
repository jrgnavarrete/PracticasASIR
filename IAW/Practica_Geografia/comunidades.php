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
        $consulta = "select nombre from comunidades order by nombre;";
        $resultado = mysqli_query($conexion, $consulta) or die ("Consulta a la base de datos fallida.");

        if (mysqli_num_rows($resultado) > 0) { //Si la tabla tiene datos...
    ?>
            <form action=provincias.php> 
                <label for="comunidades">Elija la Comunidad deseada</label>
                <select name=comunidades>
                    <?php
                        while ($fila = mysqli_fetch_assoc ($resultado)){
                            echo "<option value='{$fila["nombre"]}'>{$fila["nombre"]}</option>";
                        }                    
                    ?>
                </select>
                <button> Buscar provincias </button>
            </form>
    <?php
        } else {
            echo "No hay datos actualmente en la base de datos.";
        }    
    ?>
</body>
</html>