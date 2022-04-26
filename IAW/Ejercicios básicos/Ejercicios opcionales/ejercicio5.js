/* Se ingresan tres notas de un alumno, si el promedio es mayor o igual a 4 mostrar un mensaje 'regular', sino 'reprobado'. */
const notaAlumno = (in1, in2, in3) => {
    if (((Number(in1) + Number(in2) + Number(in3))/3 >= 4)){
        document.write("Regular");
    } else {
        document.write("Reprobado");
    }
}

notaAlumno(prompt("Introduce nota 1: "), prompt("Introduce nota 2: "), prompt("Introduce nota 3: ") )
