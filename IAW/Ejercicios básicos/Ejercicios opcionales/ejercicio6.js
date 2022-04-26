/*Se ingresa por teclado un número positivo de uno o dos dígitos (1..99) mostrar un mensaje indicando si el 
número tiene uno o dos dígitos. */

const digitos = (in1) => {
    if (isNaN(in1)) {
        document.write("No has introducido un número");
    } else {
        if (in1 < 0 || in1 > 99) {
            document.write("No has introducido un número positivo de una o dos cifras.");
        } else if (in1 < 10) {
            document.write("El número es de una cifra.");
        } else {
            document.write("El número es de dos cifras.");
        }
    }
    
}

digitos(prompt("Introduce un número de una o dos cifras: "));