/* Se ingresa por teclado un valor entero, mostrar una leyenda que indique si el número es positivo, cero o negativo */
const positivoNegativo = (in1) => {
    if (isNaN(in1)) {
        document.write("No has introducido un número válido");
    } else {
        if (Number(in1) > 0) {
            document.write("Número positivo.");
        } else if (Number(in1) < 0) {
            document.write("Número negativo.");
        } else {
            document.write("Es el cero.");
        }
    }
}

positivoNegativo(prompt("Introduce el número a identificar: "))