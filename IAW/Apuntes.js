var variable = "variablenormal, algo desfasada ya";
let variable2 = "variable con menor alcance" 
// solo existe dentro del bloque en el que se creó, concepto scope";
const constante = "no cambia, si la cambiamos, dará error";

let numero;
// Esa variable está undefined, existe pero no tiene valor asignado.
numero = 2;
// Ahí le damos el valor. Se puede hacer del tirón con let numero = 2;
const numero;
// Esto da error porque const no puede crearse undefined. 
let numero1 2, numero2 3; 
// Se pueden declarar e inicializar variables con una coma
let valornulo = null; 
// En este caso sí le pones un valor, pero nulo.
let nombre = jorge;
alert(numero1 + numero2); // Esto suma tal cual.
alert(numero1 + nombre); // Esto concatena, al ser uno un string.
alert(numero1 * nombre); // Esto sin embargo sí da error, NaN (Not a Number)

document.write(numero1); // lo escribe en el html

let nombreusuario = prompt("dime tu nombre"); 
// Esto es una función que te saca ese mensaje en el navegador
// con una caja de texto, lo que escribes lo guardamos en la variable.

// OPERADORES ASIGNACIÓN ---------------------------------------------
numero1 += 1; // suma, resta
numero1 *= 2; // multiplicacion, división, elevar **, resto %
numero1 <<=25; // de desplazamiento <<, >> o >>>
numero1 &= 1; // operadores lógicos &, XOR ^ y OR |.

// OPERADORES ARITMÉTICOS -------------------------------------------
numero2++; // numero2-- Incrementar y decrementar en uno.

//CONCATENAR --------------------------------------------------------
let saludo = "Payasa";
let pregunta = "¿como vas zorra?";
let frase = saludo + " " + pregunta;
document.write(frase);

let concatenar_numeros = "numero1.concat(numero2)";
let concatenar_conbacktits_algoenmedio =`hola ${saludo} pregunta`;
document.write(concatenar_conbacktits_algoenmedio);

// BACKTICKS --------------------------------------------------------
// Se usan para concatenar como arriba
// Se pueden usar tambien para poner HTML dentro.
let backticks `	<div>
					<h1>Hola</h1>
					<h2>Zorra</h2>
				</div>`;
document.write(backticks);
// Tambien se les puede meter un ENTER en el código para salto de línea
// no haría falta poner un \n\ para saltar de línea como con comillas.

// OPERADORES DE COMPARACIÓN ------------------------------------------------
// Son los que devuelven o true o false, comparan, lo típico xd
let igual = numero1 == numero2;
let distinto = numero1 != numero2;
let igual_y_mismo_tipo_de_dato = numero1 === numero2;
let distinto_y_distinto_tipo = numero1 !== numero2;
// Y luego los de <, >, <=, >=.

// OPERADORES LÓGICOS --------------------------------------------------
// And &&, OR ||, NOT !

// CAMEL CASE -----------------------------------------------------------
// primeraSegundaTerceraCuartaQuinta; Así es como se trabaja en JS.

// CONDICIONALES -----------------------------------------------------
let condicionalesEjemplo = 3;

if (condicionalesEjemplo == 0) {
	document.write(`${condicionalesEjemplo} es igual a 0`);
}
else if (condicionalesEjemplo > 0) {
	document.write(`${condicionalesEjemplo} es mayor que 0`);
}
else {
	document.write(`${condicionalesEjemplo} es menor que 0`);
}

// ARRAYS --------------------------------------------------------------
let arrayFrutas = ["kiwi","pera","pene"];
let elemento2Array = arrayFrutas[2]; // Ojo, empieza por 0.

let arrayAsociativo = {
	cpu: "Ryzen 7",
	ram: "16",
	espacio: "1TB",
};
let elementoArrayAsociativo = arrayAsociativo["cpu"];

let miProcesador = arrayAsociativo["cpu"];
let miRam = arrayAsociativo["ram"];
let miPC = `Mi ordenador tiene un ${miProcesador} con ${ram} de RAM`;

// SWITCH --------------------------------------------------------------

// BUCLES --------------------------------------------------------------
let numeroEjemploBucles = 0;

// While normal:
while (numeroEjemploBucles < 5) {
	numeroEjemploBucles ++;
	document.write(numeroEjemploBucles + "<br>");
};

// While con break:
numeroEjemploBucles = 0;
while (numeroEjemploBucles < 50) {
	numeroEjemploBucles ++;
	document.write(numeroEjemploBucles + "<br>");
	if (numeroEjemploBucles == 7){
		break;
	}
};

// Do while normal:
numeroEjemploBucles = 0;
do {
	numeroEjemploBucles ++;
	document.write(numeroEjemploBucles + "<br>");
} while (numeroEjemploBucles < 5);

// For normal:
for (let i = 0; i <= 5;i++) {
	document.write(i + "<br>");
};

// For con continue, se salta ese paso del bucle
for (let i = 0; i <= 5;i++) {

	if (i == 3) {
		continue; // así no imprime el 3
	}

	document.write(i + "<br>");
};

// For in: Devuelve la posic ión (el índice) del array, tambn muestra propiedades si las hay (POO)
let animales = ["gato", "perro", "mosca"];

for (indice in animales){
	document.write(indice + "<br>");
};

for (indice in animales){
	document.write(animales[indice] + "<br>");
	// Así sí imprimiría cada animal
};

// For of: Devuelve el valor de cada posición del array
for (animal of animales){
	document.write(animal + "<br>");
};

// LABELS ----------------------------------------------------------------
forArriba:
for (let i; i >= 5; i++){
	for (let i; i >= 3; i++){
		break forArriba; // Sale del for de arriba gracias a la label.
	};
};

// FUNCIONES -------------------------------------------------------------
// Ejemplo declarar función:
function ejemplo(){
	for (indice in animales){
	document.write(indice + "<br>");
	};
};
// Ejemplo llamar función:
ejemplo();

// Ejemplo simple con return:
function devuelveUno(){
	return "1";
};
let asignacionSalida = devuelveUno();

// Funcion con parámetros:
function suma (in1,in2) {
	let result = in1+in2;
	document.write(`El resultado es ${result}.
		`)
};

suma (12,34);

function suma (in1,in2) {
	let result = in1+in2;
	return result;
};

document.write(suma(20,5));

// Funciones flecha
const resta = (in1,in2)=>{
	let result = in1-in2;
	return result;
};

document.write(resta(20,10));

// Funcion flecha simple
const saludar = nombre => document.write(`Hola, ${nombre}.`);

// Funcion flecha simple, se autoretornan
const resta10 = in1 => in1-10;

