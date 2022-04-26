let letras = ['T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E', 'T'];

const verificaDni = (dni) => {
    let numeros = dni.slice(0, 8);
    let letra = dni.slice(8);

    if (Number(numeros) <= 99999999 || Number(numeros > 9999999)) {
        if (letra.toUpperCase() == letras[Number(numeros)%23]) {
            document.write(`El DNI ${dni} es correcto.`);
        } else {
            document.write(`El DNI ${dni} es incorrecto.`);
        }
    } else {
        document.write("Introduce un DNI correcto (Cifras incorrectas).");
    }
}

verificaDni(prompt("Introduce el DNI a verificar: "));