/* - Escribe un programa que pida dos números y devuelva true si uno de los números es 100 o si la suma de ambos es 100. */
const programaUno = (in1,in2) => {
    if (Number(in1)+Number(in2) == 100 || in1 == 100 || in2 == 100){
        return true; // Devolvemos el true si se cumple la condición
    } else {
        return false; // Devolvemos false en caso contrario
    }
};

let numero1 = prompt("Escribe el primer número para el programa: ");
let numero2 = prompt("Escribe el segundo número para el programa: ");
document.write(programaUno(numero1,numero2));