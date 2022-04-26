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
        $consulta = "select loc.nombre from localidades loc, provincias p where loc.n_provincia = p.n_provincia && '{$_GET['provincias']}' = p.nombre order by nombre;";
        $resultado = mysqli_query($conexion, $consulta) or die ("Consulta a la base de datos fallida.");
        if (mysqli_num_rows($resultado) > 0) { //Si la tabla tiene datos...
    ?>
            <form action=localidades.php>
                <label for="localidades">Elija la localidad deseada</label>
                <?php echo "<input type=hidden name=provincias value = {$_GET['provincias']}>";?>
                <select name=localidades>
                    <?php
                        while ($fila = mysqli_fetch_assoc ($resultado)){
                            echo "<option value='{$fila["nombre"]}'>{$fila["nombre"]}</option>";
                        }                    
                    ?>
                </select>
                <button> Buscar población </button>
            </form>
    <?php
            if (isset($_GET['localidades'])){
                $consulta2 = "select poblacion from localidades where nombre = '{$_GET['localidades']}';";
                $resultado2 = mysqli_query($conexion, $consulta2) or die ("Consulta a la base de datos fallida.");
                while ($fila = mysqli_fetch_assoc ($resultado2)){
                    echo "{$_GET['localidades']} tiene {$fila['poblacion']} habitantes.";
                } 
            } else {
                echo "No hay localidad seleccionada";
            }
        } else {
            echo "No hay datos actualmente en la base de datos.";
        }    
    ?>
</body>
</html>