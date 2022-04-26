/* const factorialR = (n) => {
    if (n == 0){
        return 1;
    } else {
        return n * factorialR(n-1);
    }
}

document.write(factorialR(prompt("Introduce num: "))); */

const fibonacciR = (n) => {
    if (n == 1 || n == 0){
        return 1;
    } else {
        return fibonacciR(n-1) + fibonacciR(n-2);
    }
}
document.write(fibonacciR(prompt("Introduce num: ")));
