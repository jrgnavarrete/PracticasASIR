const factorial = (n) => {
    if (isNaN(n)) {
        alert("No has escrito un número.");
        return null;
    } else {
        let result = 1;
        for (i = 1; i <= n; i++) {
            result = result * i;
        };
        return result;
    }
}

document.write(factorial(prompt("Número a calcular su factorial:"))); 

