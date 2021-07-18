// Take a look at the code here. Notice the VSCode will 
// provide errors
function getPriceWithTax(amount, rate) {
    var price = amount.toFixed(2);
    var tax = price * rate;
    return price + tax;
}
var answer = getPriceWithTax(23.99, 9.5);
console.log(answer);
