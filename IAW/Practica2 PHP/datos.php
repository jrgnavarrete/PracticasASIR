<?php
    if(isset($_POST['nombre'])){ //IF que devuelve true si el nombre (obtenido mediante $_POST) está seteado (isset)
        print "El nombre es ".$_POST['nombre']."<br>"; // Si está seteado, lo imprimo
    }  
        
    isset($_POST['edad']) ? print $_POST['edad']."<br>" : ""; // Método acortado de IF para PHP, si la edad está seteada, la imprimo
    
    ?>

   <h3> <a href="./ejemploPost.php">Volver</a> </h3> 

  