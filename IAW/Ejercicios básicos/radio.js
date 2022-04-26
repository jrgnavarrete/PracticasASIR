let radio = prompt("¿Cuál es el radio del círculo del cual quieres calcular su área?");
const pi = 3.141526;

const areaCirculo = (radio) => {
    if (radio > 0){
        document.write("El área es: " + Math.round(pi * radio * radio));
    }
    else {
        document.write("Introduce un radio correcto.");
    }   
};

areaCirculo(radio);