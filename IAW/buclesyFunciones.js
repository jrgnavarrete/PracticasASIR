// ------------------------------------------- EJERCICIO 1 ----------------------------------------------------
/* - Escribe un programa que pida al usuario introducir un número entero mayor que 10, el cuadro de texto 
volverá a aparecer si el número es menor. */
const pideNumero = () => {
    // Declaramos variable e inicializamos a 0
    let numero = 0;
    // Iniciamos el bucle que pide al usuario introducir el número
    do {
        // Pedimos al usuario que introduzca el número:
        numero = prompt("Introduce un número mayor a 10:");
    } while (numero <= 10 || isNaN(numero) == true);
    // El bucle se repite mientras que el número no sea un número, o mientras sea menor o igual que 10.
}

// pideNumero();

// ------------------------------------------- EJERCICIO 2 ----------------------------------------------------
/* - Escribe un programa que pida al usuario introducir un número entero entre 50 y 100, el cuadro de texto
volverá a aparecer si el número es menor o mayor. */
const pideNumero2 = () => {
    // Declaramos variable e inicializamos a 0
    let numero = 0;
    // Iniciamos el bucle que pide al usuario introducir el número
    do {
        // Pedimos al usuario que introduzca el número:
        numero = prompt("Introduce un número entre 50 y 100:");
    } while (numero < 50 || numero > 100 || isNaN(numero) == true);
    // El bucle se repite mientras que el número no sea un número, o mientras no esté entre 50 y 100.
}

// pideNumero2();
// ------------------------------------------- EJERCICIO 3 ----------------------------------------------------
/* - Escribe un programa que muestre por pantalla una tabla de multiplicar. En primer lugar se le pedirá al 
usuario que introduzca un número entre 2 y 10. Si el número no está entre estos dos valores, se le seguirá 
pidiendo hasta que introduzca el valor correcto. Una vez haya introducido un valor entre 2 y 10, se mostrará 
por consola la tabla de multiplicar del número elegido. */
const tablaMultiplicar = () => {
    // Declaramos variable e inicializamos a 0
    let numero = 0;
    // Iniciamos el bucle que pide al usuario introducir el número
    do {
        // Pedimos al usuario que introduzca el número:
        numero = prompt("Introduce un número entre 2 y 10 para mostrar su tabla de multiplicar (de 0 a 10):");
    } while (numero < 2 || numero > 10 || isNaN(numero) == true);
    /* El bucle se repite mientras que el número no sea un número, o mientras no esté entre 50 y 100.
    Aunque yo personalmente hubiese hecho la función para que compruebe si el parámetro de entrada es un número entre 2 y 10 directamente,
    tras realizar todo ese proceso anterior, ahora empezamos con el bucle para mostrar la tabla de multiplicar: */
    document.write(`La tabla de multiplicar de ${numero} es:<br>`);
    for (i = 0; i <= 10; i++) {
        document.write(`${numero} * ${i} = ${numero*i} <br>`);
    }
}

// tablaMultiplicar();

// ------------------------------------------- EJERCICIO 4 ----------------------------------------------------
const dibujaNoTriangulo = () => {
    // Para dibujar la mitad de un triangulo nos basta con un simple for anidado
    for (i = 1; i <= 7; i++){ // Este for salta de línea
        for (e = 1; e <= i; e++){ // Este for imprime los asteriscos
            document.write("*");
        }
        document.write("<br>");
    }
}

// dibujaNoTriangulo();

// ------------------------------------------- EJERCICIO 5 ----------------------------------------------------
const ordenaNumeros = (in1, in2, in3) => {
    // Comprobamos que son números:
    if (isNaN(in1) || isNaN(in2) || isNaN(in3)){
        document.write("No has introducido tres números.");
    } else {
        // Introducimos los números en un array. Como siempre son 3, no necesitamos un for of.
        let numeros = [in1,in2,in3];
        // Usamos el método sort para ordenar, pero al ser números tenemos que usarlo con esa función flecha conjuntamente.
        let ordenados = numeros.sort((a,b)=>{
        return a-b;
        })
        document.write(`De menor a mayor: ${numeros[0]}, ${numeros[1]}, ${numeros[2]}.`);
    }   
}

// ordenaNumeros(prompt("Introduce número 1:"),prompt("Introduce número 2:"),prompt("Introduce número 3:"));

// ------------------------------------------- EJERCICIO 6 ----------------------------------------------------
const esPrimo = num => {
    // Declaramos e inicializamos variable booleana donde guardamos si es primo
    let primo = true;
    // Comprobamos que se ha introducido un número y que es igual o mayor a 2.
    if (isNaN(num) || num < 2){
        document.write("No has introducido un número, o era menor que 2.")
    }
    else {
        // Bucle que va dividiendo el número para ver si alguno da resto 0
        for(i = 2; i < num; i++){
            if (num%i == 0){
                // En caso de que de resto 0, primo es false y salimos del bucle.
                primo = false;
                break;
            }
        }
        if (primo == true){
            document.write(`${num} es primo.`);
        }
        else {
            document.write(`${num} NO es primo.`);
        }
    }
}

// esPrimo(prompt("Número para calcular si es primo: "));

// ------------------------------------------- EJERCICIO 7 ----------------------------------------------------
/* - Realiza un programa que te de la opción de elegir la operación matemática 
que quieres realizar por medio de funciones. */

// Obviamente no tiene sentido crear funciones para solo una suma, una resta etc. pero es lo que se pide.
const suma = (num1,num2) => {
    return(`La suma de ${num1} y ${num2} es: ${Number(num1)+Number(num2)}.`);
}

const resta = (num1,num2) => {
    return(`La resta de ${num1} y ${num2} es: ${Number(num1)-Number(num2)}.`);
}

const multiplica = (num1,num2) => {
    return(`La multiplicación de ${num1} y ${num2} es: ${Number(num1)*Number(num2)}.`);
}

const divide = (num1,num2) => {
    return(`La división de ${num1} y ${num2} es: ${Number(num1)/Number(num2)}.`);
}

const potencia = (num1,num2) => {
    return(`${num1} elevado a ${num2} es: ${Number(num1)**Number(num2)}.`);
}

const modulo = (num1,num2) => {
    return(`El resto de ${num1}/${num2} es: ${Number(num1)%Number(num2)}.`);
}

// Función principal:
const operaciones = num => {
    alert("Actualmente la aplicación solo soporta introducir DOS números, disculpen las molestias. \nPD: Si no introduces números, el programa solicitará de nuevo la introducción.");
    // Declaramos variables e inicializamos a 0 para evitar valores basura.
    let num1 = 0;
    let num2 = 0;
    do {
        // Pedimos al usuario los números mientras que no sean números.
        num1 = prompt("Introduce el primer valor:");
        num2 = prompt("Introduce el segundo valor:");
    } while (isNaN(num1) || isNaN(num2));

    // Le damos a elegir la operación.
    let operacion = prompt("Introduce 'Z' para sumar.\nIntroduce 'X' para restar.\nIntroduce 'C' para multiplicar.\nIntroduce 'V' para dividir.\nIntroduce 'B' para calcular la potencia.\nIntroduce 'N' para calcular el modulo.\n");
    // Con un switch case para no poner tantos IF, llamamos a las funciones.
    switch (operacion.toUpperCase()) {
        case "Z":
            document.write(suma(num1,num2));
            break;
        case "X":
            document.write(resta(num1,num2));
            break;
        case "C":
            document.write(multiplica(num1,num2));
            break;
        case "V":
            document.write(divide(num1,num2));
            break;
        case "B":
            document.write(potencia(num1,num2));
            break;
        case "N":
            document.write(modulo(num1,num2));
            break;  
        default:
            alert("No has introducido una operación valida...");
            break;
      }
}

operaciones();