/* Definir una función que muestre información sobre una cadena de texto que se le pasa 
como argumento. A partir de la cadena que se le pasa, la función determina si esa cadena está 
formada sólo por mayúsculas, sólo por minúsculas o por una mezcla de ambas */

const MayusMinus = (n) => {
    if (n == n.toUpperCase()){
        return("La cadena es toda mayúscula.");
    } else if (n == n.toLowerCase()){
        return("La cadena es toda minúscula.");
    } else {
        return("La cadena es una mezcla de mayus y minus.");
    }
}

document.write(MayusMinus(prompt("Introduce la cadena a analizar")));