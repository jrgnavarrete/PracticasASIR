class circulo {
    constructor(radio){
        this.radio=radio;
    }

    area(){
        return 3.14159*this.radio*this.radio;
    }

    diametro(){
        return radio * 2;
    }

    static queSoy(){
        return "Un circulo";
    }

    set modificarRadio(newradio){ //SETTER
        this.radio = newradio;
    }
}

const miCirculo = new circulo (5);
document.write(miCirculo.area());
document.write("<br>");

class suma {
    constructor(sumando1, sumando2){
        this.sumando1 = sumando1;
        this.sumando2 = sumando2;
    }
    sumame(){ // método normal
        document.write(`El resultado de esta suma es ${this.sumando1+this.sumando2}.`);
    }

    static queSoy(){ // método estático
        document.write(`Esto es una suma.`);
    }

    set modificarSumando1(newsumando1){ //SETTER
        this.sumando1 = newsumando1;
    }

    set modificarSumando2(newsumando2){ //SETTER
        this.sumando2 = newsumando2;
    }
}

const miSuma = new suma (5,10);
miSuma.sumame();