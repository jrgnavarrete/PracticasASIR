const valida = () => {
    // Comprobar que no ha dejado campos nulos
    if (document.getElementById('nombre').value == "") {
        alert("El nombre no puede estar vacío.");
        return false;
    } else if (document.getElementById('apellidos').value == "") {
        alert("El apellido no puede estar vacío.");
        return false;
    } else if (document.getElementById('mail').value == ""){
        alert("El email no puede estar vacío.");
        return false;
    }

    // email correcto
    expresionRegularEmail = /^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (!expresionRegularEmail.test(document.getElementById('mail').value)){
        alert ("El email no es correcto");
        return false;
    }

    // Sexo seleccionado
    opcionesSexo = document.getElementsByName("sexo");
    let seleccionado = false;
    for(i = 0; i < opcionesSexo.length; i++) {
      if(opcionesSexo[i].checked) {
            seleccionado = true;
            break;
      }
    } if (!seleccionado) {
        alert("Tienes que seleccionar sexo.");
        return false;
    }

    // País seleccionado
    indice = document.getElementById("pais").selectedIndex;
    if( indice == null || indice == 0 ) {
        alert ("Debes seleccionar un país.");
        return false;
    }

    // Aceptar publicidad
    if(!document.getElementById('ad').checked) {
        alert ("Debes aceptar que te envíemos publicidad sí o sí.");
        return false;
    }
}