

// These functions take a funtion as an argument. 
// Set the type these parameters

// In all of the functions below type the callback

// This function takes a callback that receives a string. 

function callYouLater(callback: (message: string) => void, time: number) {
	setTimeout(() => {
		callback('What it be like?')
	}, time)
}


// The callback parameter in this function returns an object
// with two properties! 

type CallMeResults = {
	success: boolean, 
	probability: number
}

function callMeMaybe(callback: (results: CallMeResults) => void, probability) {
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
