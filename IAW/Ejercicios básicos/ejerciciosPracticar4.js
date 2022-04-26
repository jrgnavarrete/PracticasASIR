/* -  Escribe un programa que coja los primeros 3 caracteres y los 3 últimos de una cadena dada, los junte y los muestre.
 Si la longitud de la cadena es menor de 6, devolverá la cadena original.. */

const get3Caracteres = (in1) => {
   if (in1.length < 6){
        return in1;
        // Si la palabra es menor de 6 caracteres la devolvemos directamente.
   } else {
        return in1.substr(0,3)+in1.substr(in1.length-3,in1.length);
        // Si es de 6 caracteres o mas, hacemos un substring para obtener los primeros tres caracteres, y lo concatenamos con el substring para obtener los ultimos tres.
   }
};

let texto = prompt("Escribe la palabra de la que quieres que extraiga los 3 primeros y últimos caracteres: ");
document.write(get3Caracteres(texto));

