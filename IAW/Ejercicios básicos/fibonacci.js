
function fibonacci(n) {
    let a, b, result;
    a = 0;
    b = 1;
    for (var i = 2; i < n; i++) {
        result = a + b;
        a = b;
        b = result;
    }
    return result;
}

document.write(fibonacci(prompt("Introduce el número hasta donde calcular Fibonacci: ")));
