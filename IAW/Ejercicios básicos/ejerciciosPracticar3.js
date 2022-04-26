/* - Escribe un programa que devuelva la extensión del nombre de un fichero que se le pida al usuario. */

const getExtension = (in1) => {
   return in1.split(".").pop();
   // El método split sobre un texto nos permite indicar el carácter que queremos usar como "separador".
   // Después usamos el método pop sobre el método anterior para solo quedarnos con lo posterior al separador.
};

let archivo = prompt("Escribe el nombre de archivo del que se obtendrá la extensión: ");
document.write(getExtension(archivo));

