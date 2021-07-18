

// These functions take a funtion as an argument. 
// Set the type these parameters

// In all of the functions below type the callback

// This function takes a callback that receives a string. 

function callYouLater(callback, time) {
	setTimeout(() => {
		callback('What it be like?')
	}, time)
}


// The callback parameter in this function returns an object
// with two properties! 

function callMeMaybe(callback, probability) {
	setTimeout(() => {
		if (Math.random() * 100 < probability) {
			callback({ success: true, probability })
		}
		return callback({ success: false, probability })
	}, 1000)
}

// 


export {
	callYouLater,
	callMeMaybe
}
