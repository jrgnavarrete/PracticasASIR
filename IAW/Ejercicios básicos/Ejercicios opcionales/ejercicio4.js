/* Realizar un programa que lea por teclado dos números, si el primero es mayor al segundo informar su suma 
y diferencia, en caso contrario informar el producto y la división del primero respecto al segundo. */

const calcularDosNumeros = (in1, in2) => {
    if (in1 > in2) {
        document.write(`La suma de ambos números es: ${Number(in1) + Number(in2)}. <br>
                        La diferencia entre ambos números es: ${Number(in1) - Number(in2)}.`);
    } else {
        document.write(`El producto de ambos números es: ${Number(in1) * Number(in2)}. <br>
        La diferencia entre ambos números es: ${Number(in1) / Number(in2)}.`)
    }
}

calcularDosNumeros(prompt("Introduce el primer número: "), prompt("Introduce el segundo número: "));