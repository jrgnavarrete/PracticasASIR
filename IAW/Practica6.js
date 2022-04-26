class cliente {
    constructor(nombre, apellido1, apellido2, saldo){
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.saldo = saldo;
    }
    verSaldo(){
        document.write(`El cliente ${this.nombre} ${this.apellido1} ${this.apellido2} tiene ${this.saldo} Euros de saldo. <br>`);
    }

    set sumaSaldo(cantidad){ 
        this.saldo = this.saldo+cantidad;
    }

    set restaSaldo(cantidad){ 
        this.saldo = this.saldo-cantidad;
    }
}

const valerie = new cliente ("Valerie","Galindo","Gutierrez",2);
const dani = new cliente ("Dani","Guiza","Guti",321);
valerie.verSaldo();
dani.verSaldo();
document.write(`* Se le va a sumar a Valerie 150 Euros de saldo.* <br>`);
valerie.sumaSaldo = 150;
valerie.verSaldo();
document.write(`* Se le va a restar a Dani 400 Euros de saldo.* <br>`);
dani.restaSaldo = 400;
dani.verSaldo();