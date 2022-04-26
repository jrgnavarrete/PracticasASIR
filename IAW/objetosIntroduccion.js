class coche {
    constructor(fabricante, modelo, potencia){
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.potencia = potencia;
    }
    verInfo(){
        document.write(`El coche es un ${this.fabricante} ${this.modelo} con ${this.potencia} CV.`);
    }

    set modificarPotencia(newPotencia){ //SETTER
        this.potencia = newPotencia;
    }
}

class cocheRacing extends coche {
    constructor(fabricante,modelo, potencia, categoria){
        super(fabricante, modelo, potencia);
        this.categoria = categoria;
    }
    static hacerRuido(){ // Metodo estatico porque no necesita la creacion del objeto, no usa sus propiedades. Se puede llamar con la clase
        document.write("brum brum");
    }
}

const seat = new coche("Seat", "Leon", "200");
const clio = new coche("Renault", "Clio", "300", "R5");
seat.modificarPotencia = 235;
