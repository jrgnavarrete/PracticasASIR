/* - Escribe un programa que concatene dos cadenas excepto el primer carácter de cada una de ellas.*/

const concatenaExcepto1 = (in1) => {
    return in1.substr(0,in1.length/2); 
    // Devolvemos el substring obtenido del texto, empezando por cero y hasta la mitad de su longitud.
};

let texto = prompt("Escribe la palabra de la que quieres que extraiga la primera mitad: ");
document.write(concatenaExcepto1(texto));

