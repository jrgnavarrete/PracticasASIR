<?php 
include("conexion.php"); // Incluir el archivo de conexión para usar sus variables

$connection = mysqli_connect($sevidor,$usuario,$contrasena,$base_datos) or die("No ha sido posible establecer la conexión."); 
// Variable connection usando mysqli_connect con los datos de la conexión. El "or die" se devuelve en caso de que falle.

if(isset($_POST['nombre'])){ // Si el nombre está seteado...
   
  $insertar = "INSERT INTO persona (nombre, edad) VALUES ('{$__POST['nombre']}', {$__POST['edad']});"; 
  // Variable para guardar código SQL para insertar en la bbdd el nombre
  $resultado =  mysqli_query($connection, $insertar) or die("No se ha podido introducir el dato en la BBDD."); 
  // Mysqli_query con el primer parámetro de los datos de conexión, y con el segundo el código SQL. Debe introducir el nombre en la BBDD
  echo "El nombre ha sido introducido en la BBDD."
}

?>