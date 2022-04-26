/* Se cargan por teclado tres números distintos. Mostrar por pantalla el mayor de ellos. */
const numMayor = (in1, in2, in3) => {

    if (isNaN(in1) || isNaN(in2) || isNaN(in3)){
        document.write("No has introducido números válidos.");
    } else {
        if (Number(in1) >= Number(in2) && Number(in1) >= Number(in3)) {
            document.write(`El mayor número introducido es ${in1}`);
        } else if (Number(in2) >= Number(in1) && Number(in2) >= Number(in3)) {
            document.write(`El mayor número introducido es ${in2}`);
        } else {
            document.write(`El mayor número introducido es ${in3}`);
        }
    }
    
}

numMayor(prompt("Introduce el primer valor:"), prompt("Introduce el segundo valor:"), prompt("Introduce el tercer valor:"));