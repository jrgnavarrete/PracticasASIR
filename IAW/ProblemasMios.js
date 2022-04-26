
 /*1. Encontrar todos los divisores de un número. 
 const divisoresNumero = num => {
 	document.write(`Los divisores de ${num} son: <br>`);
 	for (i = 0; i <= num; i++){
 		if (num%i == 0){
 			document.write(i + "<br>");
 		}
 	}
 }

divisoresNumero(prompt("Número para calcular sus divisores: "));
*/

/*2. Determinar si un número ingresado por el usuario en un loop 
es primo o no, validar que el número  sea mayor o igual a 2. 
 const esPrimo = num => {
 	let primo = true;
 	if (num >= 2){
 		for(i = 2; i < num; i++){
 			if (num%i == 0){
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
 	else {
 		document.write("Introduce un número igual o mayor que 2.");
 	}
 }

 esPrimo(prompt("Número para calcular si es primo: ")); 
 */

 
/* 3. Crear un programa que determine si un número es perfecto o no, 
 (Si el número es igual a sus divisores, ejemplos 6 = 1 + 2 + 3)
 const esPerfecto = num => {
 	let suma = 0;
 	for (i = 0; i < num; i++){
 		if (num%i == 0){
 			suma = suma + i;
 		}
 	}
 	if (suma == num){
 		document.write(`${num} es perfecto.`);
 	}
 	else {
 		document.write(`${num} NO es perfecto.`);
 	}
 }

 esPerfecto(prompt("Número para calcular si es perfecto: ")); 
*/

/*
const numerosPrimos = n => {
	let primo;
	let num = 2;
	let cont = 1;

	while (cont <= n){
		primo = true;
		for(i = 2; i < num; i++){
 			if (num%i == 0){
 				primo = false;
 				break;
 			}
 		}
 		if (primo == true){
 			document.write(`${num} <br>`);
 			cont++;
 		}
 		num++;
	}
}
numerosPrimos(prompt("¿Cuántos primos quieres?"));


const primosHasta = n => {
	for (i = 2; i <= n; i++){
		primo = true;
		for(e = 2; e < i; e++){
 			if (i%e == 0){
 				primo = false;
 				break;
 			}
 		}
 		if (primo == true){
 			document.write(`${i} <br>`);
 		}
	}
}
primosHasta(prompt("¿Hasta donde quieres primos?")); 


const dibujameHueco = (h,a) => {
	for (i = 1; i <= h; i++){
		if (i == 1 || i == h){
			for (e = 1; e <= a; e++){
				document.write("*");
			}
			document.write("<br>");
		}
		else {
			for (e = 1; e <= a; e++){
				if (e == 1 || e == a){
					document.write("*");
				}
				else {
					document.write(". ");
				}
			}
			document.write("<br>");
		}
	}
}

let h = prompt("¿Qué altura quieres que tenga el rectángulo?");
let a = prompt("¿Qué ancho quieres que tenga el rectángulo?");

dibujameHueco(h,a);


const tableroAjedrez = (h, a) => {
	if (a%2 != 0){
		document.write("El ancho debe de ser par.");
	}
	else {
		for (i = 1; i <= h; i++){
			if (i%2 != 0){
				for (e = 1; e <= a/2; e++){
					document.write("* .");
				}
				document.write("<br>");
			}
			else {
				for (e = 1; e <= a/2; e++){
					document.write(". *");
				}
				document.write("<br>");
			}
		}
	}
	
}

let height = prompt("¿Qué altura quieres que tenga el tablero?");
let ancho = prompt("¿Qué ancho quieres que tenga el tablero?");

tableroAjedrez(height,ancho);
*/

const dibujaDiamante = h => {
	let mitad = h/2 + 0.5;
	let control = 1;
	let escritos = 0;

	if (h%2 == 0) {
		document.write("La altura debe de ser impar.");
	}
	else {
		for (i = 1; i <= mitad; i++){
			escritos = 0;
			while (escritos < control){
				document.write("*");
				escritos++;
			}
			document.write("<br>");
			control = control + 2;
		}

		control = h - 2;
		for (i = mitad - 1; i >= 1; i--){
			escritos = 0;
			while (escritos < control){
				document.write("*");
				escritos++;
			}
			document.write("<br>");
			control = control - 2;
		}
	}
}

dibujaDiamante(prompt("De qué altura quieres el diamante?"));

*/

/* 1. Dado el array = [1,2,3,4,5,6]. Iterar por todos los elementos.
Mostrar todos los elementos dentro de un array sumándole uno a cada uno.
Generar una copia de un array pero con todos los elementos incrementado en 1.
Calcular el promedio */

/*
let arrayEjemplo = [1,2,3,4,5,6];

document.write("Valores del array: ")
for (let valor of arrayEjemplo){
	document.write(`${valor}, `);
}

let arrayEjemploUno = [];
let cont = 0;
for (let valor of arrayEjemplo){
	arrayEjemploUno[cont]=valor+1;
	cont++;
}

document.write("<br> Valores del array copia más uno: ");
for (let valor of arrayEjemploUno){
	document.write(`${valor}, `);
}

document.write("<br> Cálculo del promedio: ");
let suma = 0;
cont = 0;
for (let valor of arrayEjemploUno){
	suma = valor + suma;
	cont ++;
}
document.write(suma/cont);
*/

/* 2. Crear un array vacío, luego generar 20 números al azar y guardarlos en un array. 
let arrayRandom=[];
for (i=0; i < 20; i++){
	arrayRandom[i]=Math.round((Math.random()*100));
}

document.write("Valores del array random: ")
for (let valor of arrayRandom){
	document.write(`${valor}, `);
}



