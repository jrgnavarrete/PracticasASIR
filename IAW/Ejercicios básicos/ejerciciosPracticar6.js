/* - Escribe un programa que concatene dos cadenas excepto el primer carácter de cada una de ellas.*/

const concatenaExcepto1 = (in1, in2) => {
    return in1.substr(1,in1.length)+in2.substr(1,in2.length);
    // Devolvemos el substring de la primera palabra empezando por la letra 1 (la segunda), y concatenamos con la segunda palabra haciendo lo mismo
};

let palabra1 = prompt("Escribe la primera palabra a concatenar: ");
let palabra2 = prompt("Escribe la segunda palabra a concatenar: ");
document.write(concatenaExcepto1(palabra1,palabra2));

