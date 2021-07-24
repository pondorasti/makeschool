// Tip Calculator

// Define some variables

const amount_input 			= document.getElementById('amount')
const percent_input			= document.getElementById('percent')
const calculate_button  = document.getElementById('calculate')
const tip_display			 	= document.getElementById('tip')
const total_display 		= document.getElementById('total')

const fifteen_button = document.getElementById('fifteen-precent')
const eighteen_button = document.getElementById('eighteen-precent')
const ten_button = document.getElementById('ten-percent')

// Register Event Listeners

calculate_button.addEventListener('click', click_calculate)

// Define Event Handlers

function click_calculate(e) {
	// Get values from inputs 
	const percent = Number(percent_input.value) // Convert these to numbers if not a number NaN
	const amount = Number(amount_input.value)
	
	// TODO: Needs some validation here
	
	const tip = amount * percent / 100
	const total = amount + tip
	tip_display.innerHTML = tip.toFixed(2)
	total_display.innerHTML = total.toFixed(2)
}

ten_button.onclick = function(e) {
	fifteen_button.classList.remove('tip-selected')
	eighteen_button.classList.remove('tip-selected')
	this.classList.add('tip-selected')
} 

fifteen_button.onclick = function(e) {
	ten_button.classList.remove('tip-selected')
	eighteen_button.classList.remove('tip-selected')
	this.classList.add('tip-selected')
}

eighteen_button.onclick = function(e) {
	fifteen_button.classList.remove('tip-selected')
	ten_button.classList.remove('tip-selected')
	this.classList.add('tip-selected')
}