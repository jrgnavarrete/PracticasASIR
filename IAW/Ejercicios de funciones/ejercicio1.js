/* Escribir el código de una función a la que se pasa como parámetro un número entero y devuelve
como resultado una cadena de texto que indica si el número es par o impar. Mostrar por pantalla 
el resultado devuelto por la función. */

const parImpar = (n) => {
    if (isNaN(n)){
        return("No has introducido un número.");
    } else if (n%2 == 0) {
        return("El número es par.");
    } else {
        return("El número es impar.");
    }
}

document.write(parImpar(prompt("Introduce número para saber si es par o impar: ")));