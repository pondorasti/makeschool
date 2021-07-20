// Loop through the contents of data


// Hint 1: Loop through all of the elements see them in the console

//for (let i = 0; i < data.length; i += 1) {
//  console.log(i, data[i].first_name, data[i].age);
//}


// Hint 2: Loop again and get a few properties

//for (let i = 0; i < data.length; i += 1) {
//  console.log(data[i].prefix, data[i].first_name, data[i].last_name);
//}

// Hint 3: Build an HTML string and set it as HTML content

//let str = '';
//for (let i = 0; i < data.length; i += 1) {
//  // append to the str
//  str += `<div class="">${data[i].prefix} ${data[i].first_name} ${data[i].last_name}</div>`;
//}
// // Set as text content
//document.getElementById('content').innerHTML = str;


// Hint 4: Make a date object out of the string date

//let str = '';
//for (let i = 0; i < data.length; i += 1) {
//  console.log(data[i].prefix, data[i].first_name, data[i].last_name);
//  // Make a new date object
//  const date = new Date(data[i].date * 1000).toDateString();
//  str += `<div class="">${data[i].prefix} ${data[i].first_name} ${data[i].last_name} ${date}</div>`;
//}
//document.getElementById('content').innerHTML = str;


// Hint 5: Define a class 

class User {
	constructor(obj) {
		for (var key in obj) {
			this[key] = obj[key];
		}
	}
}

// Hint 6: Make an array to hold users
const users = [];
// make a bunch of users and push them into the array
for (let i = 0; i < data.length; i += 1) {
	users.push(new User(data[i]));
}





// Write a function to render users to HTML
function render() {
	let str = '';
	for (let i = 0; i < data.length; i += 1) {
		// Format the date into a string for display
		str += `
<div class="user">
	<span>${data[i].prefix}</span>
	<span>${data[i].first_name}</span>
	<span>${data[i].last_name}</span>
</div>`;
	}
	document.getElementById('content').innerHTML = str;
}

// Call render
render();
