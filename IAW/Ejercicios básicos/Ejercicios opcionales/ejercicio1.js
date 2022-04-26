/* Realizar la carga del lado de un cuadrado, mostrar por pantalla el perímetro del mismo 
(El perímetro de un cuadrado se calcula multiplicando el valor del lado por cuatro) */

const perimetroCuadrado = (lado) => {
    document.write(`El perímetro del cuadrado dado es ${lado*4}.`);
}

perimetroCuadrado(prompt("Introduce el lado del cuadrado a calcular: "));