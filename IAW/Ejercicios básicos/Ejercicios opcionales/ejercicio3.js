/* Realizar un programa que lea cuatro valores numéricos e informar su suma y producto. */
const calculosCuatroNum = (in1, in2, in3, in4) => {
    document.write(`La suma de los números es: ${Number(in1) + Number(in2) + Number(in3) + Number(in4)} <br>
                    El producto de los dos últimos números es: ${Number(in1) * Number(in2) * Number(in3) * Number(in4)} `);
}

calculosCuatroNum(prompt("Introduce el primer número: "), prompt("Introduce el segundo número: "), 
                  prompt("Introduce el tercer número: "), prompt("Introduce el cuarto número: "));