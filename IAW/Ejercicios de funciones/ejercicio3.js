/* Definir una función que determine si la cadena de texto que se le pasa como parámetro es un 
palíndromo, es decir, si se lee de la misma forma desde la izquierda y desde la derecha. 
Ejemplo de palíndromo complejo: "La ruta nos aporto otro paso natural".
 */

const palindromo = (n) => {
    n = n.toUpperCase(); // Poner la cadena en mayuscula para que no sea case sensitive
    n = n.replace(/\s/g, ''); // Quitar todos los espacios
    let reversa = n.split("").reverse().join(""); // Para darle la vuelta se mete en un array, se le da la vuelta, y se une otra vez.

    if (reversa == n){
        return("La cadena es un palíndromo.");
    } else {
        return("La cadena no es un palíndromo");
    }
}

document.write(palindromo(prompt("Introduce la cadena a analizar:")));
