/* Escribir un programa en el cual se ingresen cuatro números, calcular e informar la suma de los dos primeros 
y el producto del tercero y el cuarto. */

const calculosCuatroNum = (in1, in2, in3, in4) => {
    document.write(`La suma de los dos primeros números es: ${Number(in1) + Number(in2)} <br>
                    El producto de los dos últimos números es: ${Number(in3) * Number(in4)} `);
}

calculosCuatroNum(prompt("Introduce el primer número: "), prompt("Introduce el segundo número: "), 
                  prompt("Introduce el tercer número: "), prompt("Introduce el cuarto número: "));