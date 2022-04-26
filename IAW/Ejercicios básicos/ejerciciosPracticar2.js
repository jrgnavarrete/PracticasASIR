/* - Escribe un programa para crear una nueva cadena de caracteres añadiendo "Super" al principio de una cadena que 
se le pide al usuario. Si la cadena ya empieza por "Super", el resultado será la misma cadena original. */

const addSuper = (in1) => {
    if (in1.startsWith("Super")){
        return in1;
    } else {
        return `Super${in1}`;
    }
    
};

let palabra = prompt("Escribe la palabra a la que se le añadirá Super: ");
document.write(addSuper(palabra));

