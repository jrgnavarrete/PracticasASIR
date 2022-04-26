/* 1.Realizar un programa que imprima 25 términos de la serie 11 - 22 - 33 - 44, etc. 
(No se ingresan valores por teclado). */
const suma11 = () => {
    let suma = 0;
    for (i = 0; i < 24; i++){
        suma+=11;
        document.write(`${suma} - `);
    }
document.write(`${suma+11}.`);
}

// suma11();

/* 2. Mostrar los múltiplos de 8 hasta el valor 500. Debe aparecer en pantalla 8 -16 -24, etc.*/
const multiplos8 = () => {
    let contador = 1;
    let result = 0;
    while (true) {
        result = 8* contador;
        if (result >= 500) {
            break;
        } else {
            document.write(`${result} - `);
            contador++;
        }
    }
}

// multiplos8();

/* 3. Escribir un programa que lea 10 notas de alumnos y nos informe cuántos tienen notas mayores o 
iguales a 7 y cuántos menores. */
const diezNotas = () => {
    alert("A continuación se pedirá la entrada de 10 notas.");
    let notas=[];
    let input = 0;
    for (indice = 1; indice <= 10; indice++){
        input = prompt("Introduce la nota: ");
        if (isNaN(input)) {
            input = 0;
            alert("No has introducido un número, se ha cambiado la nota a 0.")
        }
        notas[indice] = Number(input);
    }
    let mas7 = 0;
    for (nota of notas) {
        if (nota >= 7) {
            mas7++;
        }
    }
    document.write(`El número de alumnos con 7 o más es: ${mas7}.<br>El número de alumnos con menos de 7 es: ${10-mas7}.` );
}

// diezNotas();

/* 4.Se ingresan un conjunto de 5 alturas de personas por teclado. Mostrar la altura promedio de las personas. */
const alturaMedia = () => {
    let alturas = [];
    let input = 0;
    for (indice = 0; indice < 5; indice++){
        input = prompt("Introduce la altura en CM: ");
        if (isNaN(input)) {
            input = 150;
            alert("No has introducido un número, se ha cambiado la altura a 150cm.")
        }
        alturas[indice] = Number(input);
    }
    sumaAlturas = 0;
    for (altura of alturas) {
        sumaAlturas += altura;
    }
    document.write(`El promedio de las alturas introducidas es: ${sumaAlturas/5}cm.`);
}

// alturaMedia();

/* 5. Realizar un programa que acumule (sume) valores ingresados por teclado hasta ingresa el 9999 
(no sumar dicho valor, solamente indica que ha finalizado la carga). Imprimir el valor acumulado e 
informar si dicho valor es cero, mayor a cero o menor a cero. */

const acumulaNumeros = () => {
    alert("A continuación se pedirán números hasta que se introduzca 9999");
    let numeros = [];
    let input = 0;
    let contador = 0;
    do {
        input = Number(prompt("Introduce número: "));
        if (isNaN(input)){
            alert("No has introducido un número, se ha cambiado el valor a 0.");
            input = 0;
        } else if (input == 9999) {
            break;
        }
        numeros[contador] = input;
        contador++;
    } while (input != 9999)

    let suma = 0;
    for (valor of numeros){
        suma += valor;
    }

    document.write(`La suma de todos los valores es: ${suma}.`);
}

// acumulaNumeros();

/* Desarrollar un programa que solicite la carga de 10 números e imprima la suma de lo últimos 5 valores ingresados. */
const sumaCinco = () => {
    let numeros = [];
    let input = 0;
    for (indice = 0; indice < 10; indice++){
        input = Number(prompt("Introduce número: "));
        if (isNaN(input)) {
            input = 0;
            alert("No has introducido un número, se ha cambiado el valor a 0.")
        }
        numeros[indice] = input;
    }

    let suma = 0;
    for (i = 4; i < 10; i++) {
        suma += numeros[i];
    }

    document.write(`La suma de los últimos 5 valores es: ${suma}.`);
}

// sumaCinco();

/* 7. Se realiza la carga de 10 valores enteros por teclado. Se desea conocer:
a) La cantidad de valores negativos ingresados.
b) La cantidad de valores positivos ingresados.
c) La cantidad de múltiplos de 15.
d) El valor acumulado de los números ingresados que son pares. */

const darInformacion = () => {
    let numeros = [];
    let input = 0;
    for (indice = 0; indice < 10; indice++){
        input = Math.round(Number(prompt("Introduce número: ")));
        if (isNaN(input)) {
            input = 0;
            alert("No has introducido un número, se ha cambiado el valor a 0.")
        }
        numeros[indice] = input;
    }

    let negativos = 0;
    let positivos = 0;
    let multiplos15 = 0;
    let sumaPares = 0;
    for (valor of numeros) {
        if (valor >= 0) {
            positivos++;
        } else {
            negativos++;
        }

        if (valor%15 == 0){
            multiplos15++;
        }

        if (valor%2 == 0){
            sumaPares+=valor;
        }
    }
    document.write(`La cantidad de números positivos (Considerando 0 positivo): ${positivos}.<br>`);
    document.write(`La cantidad de números negativos (Considerando 0 positivo): ${negativos}.<br>`);
    document.write(`La cantidad de múltiplos de 15: ${multiplos15}.<br>`);
    document.write(`La suma de todos los pares (Negativos y positivos): ${sumaPares}.<br>`);
}

// darInformacion();

/* 8. Desarrollar una función que retorne la cantidad de dígitos que tiene una variable entera positiva de 
hasta 5 dígitos. */
const numeroDigitos = (input) => {
    input = Math.round(Number(input));
    if (isNaN(input)){
        return ("Lo siento, no has introducido un número.");
    } else if (input < 0) {
        return ("Lo siento, no has introducido un número positivo.");
    } else if (input > 99999) {
        return ("Lo siento, actualmente no podemos analizar números con más de 5 cifras.")
    } else {
        if (input < 10){
            return 1;
        } else if (input < 100) {
            return 2;
        } else if (input < 1000) {
            return 3;
        } else if (input < 10000) {
            return 4;
        } else {
            return 5;
        }
    }
}

// document.write(numeroDigitos(1502.23));

/* 9. Elaborar una función que reciba tres enteros y retorne el promedio. */
function promedioTres () {
    let sumaTotal = 0;
    for (indice = 0; indice < 3; indice++) {
        if (arguments[indice]%1 !=0) {
            document.write(`Ojo: el número introducido como el parámetro "${indice+1}" no es entero.<br>`);
        }
        sumaTotal += Math.round(Number(arguments[indice]));
    }
    if (isNaN(sumaTotal)) {
        return ("Algún valor no era un número.");
    } else {
        return (`El promedio es: ${sumaTotal/3}.`);
    } 
    /* De la siguiente forma haría el promedio de todos los números que se le han introducido. 
    let sumaTotal = 0;
    for (numero of arguments) {
        sumaTotal += numero;
    }
    document.write(`El promedio es: ${sumaTotal/arguments.length}.`);
    */   
}

// document.write(promedioTres(1,5,3));

/* 10. Confeccionar una función que reciba una fecha con el formato de día, mes y año y retorne un string 
con un formato similar a: "Hoy es 27 de enero de 2020" */
const dimeFecha = (day, month, year) => {
    let mes;

    if (isNaN(day) || isNaN(month) || isNaN(year)) {
        return "Debes introducir números.";
    } else {
        switch (month) {
            case 1:
                mes = "enero";
                break;
            case 2:
                mes = "febrero";
                break;
            case 3:
                mes = "marzo";
                break;
            case 4:
                mes = "abril";
                break;
            case 5:
                mes = "mayo";
                break;
            case 6:
                mes = "junio";
                break;
            case 7:
                mes = "julio";
                break;
            case 8:
                mes = "agosto";
                break;
            case 9:
                mes = "septiembre";
                break;
            case 10:
                mes = "octubre";
                break;
            case 11:
                mes = "noviembre";
                break;
            case 12:
                mes = "diciembre";
                break;
            default:
                return ("Número de mes incorrecto.");
                break;
          }
        
        if (day > 31 || day < 1 || year > 2050 || year < 50) {
            return "Día o año no válidos.";
        } else {
            return `Hoy es ${day} de ${mes} del ${year}.`
        }
    }
}
document.write(dimeFecha(12,2,2001));