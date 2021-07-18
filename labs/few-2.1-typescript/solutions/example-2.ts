
// Take a look at the code here. Notice the VSCode will 
// provide errors. 

// Compile the code and check what type script says: 
// tsc example-2.ts

function getPriceWithTax(amount: number, rate: number): string {
	const price: number = amount
	const tax: number = price * rate
	return (price + tax).toFixed(2)
}

const answer = getPriceWithTax(23.99, 9.5)
console.log(answer)


export {
	getPriceWithTax
}
