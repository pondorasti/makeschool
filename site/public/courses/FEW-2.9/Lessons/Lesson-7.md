# FEW 2.9 Websockets

<!-- > -->

## Review 

Imagine you are working on a GraphQL card game. 

```JS
enum Suit {
	...
}

type Card {
	value: Int!
	suit: Suit!
}

type Hand {
	cards: [Card!]!
}
```

<!-- > -->

Write two GraphQL mutation *queries*: 

- Define a mutation that draws a card.
  - This is a mutation since it will remove a card from the deck and add it to your hand
- Define a mutation that discards a card. 
  - This is a mutation since it will add a card to the discard pile and remove it from your hand

<!-- > -->

## Learning Objectives

<!-- > -->

1. Describe Subscriptions
1. Describe Websockets
1. Implement a websocket server
1. Implement a websocket client

<!-- > -->

## GraphQL Subscriptions 🔌

<!-- > -->

Subscriptions represent a real time presistent connection to a GraphQL server.

Use them to send push notifications and real time updates to connected GraphQL clients.

<!-- > -->

GraphQL *doesn't* implement the code that backs up subscriptions. This is handled by the framework or library that implements the GraphQL Spec. For web based projects this is most often a websocket. 🔌 

<!-- > -->

Most often you should *not* use subscriptions to stay up to date with your backend. 

Instead poll intermittently or execute queries on user interaction. Sending out an intermittent request for an update is more efficient than maintaining a constant connection. 

<!-- > -->

Subscriptions are best used for small incremental changes. Loading large objects is expensive and doing this over a wesocket could waste resources. 

<!-- > -->

Best use of subscriptions: Low latency real time updates.

Think small amounts of data loaded in real time. 

Quick brainstorm: 

- What do you think would be good use of subscriptions?
- What do you think would be a bad use of subscriptions?

<!-- > -->

### Websockets 🔌

<!-- > -->

Websockets represent a persistent connection. Which is different from the standard call and response cycle we use most often.

<!-- > -->

Normally when we connect to a web server we make a temporary connection that sends a message, notes that the message was received and then closes down the connection. 

<!-- > -->

When you create a connection with a websocket the connection is persistent and allows for data to be passed back and forth without the overhead of opening and closing a connection with each transaction.

<!-- > -->

What can you do with a websocket? 

- Things that update in real time
- Mapping
- Games

Brainstorm use cases for websockets?

<!-- > -->

Websocket support: 

https://caniuse.com/?search=websockets

This shows pretty good support. 

<!-- > -->

### Try out Websockets

<!-- > -->

This example creates a simple server using Express.js and a web page that communicates with the server via a websocket.

<!-- > -->

There two pieces to this example. 

- The server handles a websocket connections and broadcasts messages received to all connected clients. This portion, in `server.js`, is written with node and express. The code here is specific to that environment. 
- The client code is written using the browser websocket API. This code is written in `index.js`. This client code opens a websocket connection with the server. It sends messages to the server and receives messages from the server.

<!-- > -->

#### Create the Server

<!-- > -->

Start by making a new Node project: 

- `npm init -y`
- `npm install ws express`

<!-- > -->

Create a server: 

- Create: `server.js`

<!-- > -->

Import your dependencies:

```JS
// Import dependencies
const express = require('express');
const http = require('http');
const WebSocket = require('ws');
```

<!-- > -->

```JS
// Define a port
const port = 6969;
// create a server
const server = http.createServer(express);
// Create a web socket server
const wss = new WebSocket.Server({ server })
```

<!-- > -->

The `http` is used to create an HTTP server. This will be used to listen for and emit messages to the server. 

`Websocket` is used to create server that will handle websocket connections. 

<!-- > -->

```JS
// Handle a web socket connection
wss.on('connection', (ws) => {
	// After making a connection start listening for messages
	console.log('client connecting')

  // Handle 
  ws.on('message', (data) => {
		// For each client broadcast the data
    wss.clients.forEach((client) => {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(data);
      }
    })
  })
})
```

<!-- > -->

Here the code listens for a `connection` event. When this occurs we start listening for `message` events. Any client can send these. 

The code handles a message by sending the data received from the message to all connected clients. Before broadcasting the message we check that the message didn't come from this `ws` and that the client has an open websocket connection. 

<!-- > -->

```JS
// Start the server
server.listen(port, () => {
  console.log(`Server is listening on ${port}!`)
})
```

<!-- > -->

This is more or less stadnard express code to start the server. 

<!-- > -->

#### Create the Client

<!-- > -->

Make a client. This will be a simple web page that will connect to the server.

<!-- > -->

- Create index.html

<!-- > -->

```HTML
<!DOCTYPE html>
<html>
	<head></head>
	<link href="styles.css" rel="stylesheet">
	<body>
		<h1>Simple Chat with Websockets</h1>
		<div class="container">
			<div>
				<input type="text" id="message-input" placeholder="Type your message here">
				<button id="send" title="Send Message!">Send Message</button>
			</div>
			<div>
				<ul id="messages"></ul>
			</div>
		</div>
		<script src="index.js"></script>
	</body>
</html>
```

<!-- > -->

Add some styles: 

Create `styles.css`

<!-- > -->

Add some styles to `styles.css`

```CSS
body {
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

.container {
	display: flex;
	width: 100%;
}

.container > div {
	width: calc(50% - 1em);
}

.container > div:first-child {
	margin-right: 1em;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

#messages {
	overflow: scroll;
	border: 1px solid #ddd;
	padding: 0.5em;
	border-radius: 3px;
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
	background-color: #eee;
	width: 100%;
	margin: 0;
}

input {
	display: block;
	width: 100%; 
	margin-bottom: 10px; 
	padding: 0.5em;
	border: 1px solid;
	border-radius: 3px;
	box-sizing: border-box;
	font-size: 1em;
}

#send {
	padding: 0.5em 1em;
	border: 1px solid #000;
	background-color: #000;
	color: #fff;
	border-radius: 3px;
	font-size: 1em;
	align-self: flex-end;
}
```

<!-- > -->

Create index.js and add the following: 

```JS
// Get references to DOM elements
const sendBtn = document.querySelector('#send')
const messages = document.querySelector('#messages')
const messageInput = document.querySelector('#message-input')

let ws
```

Define some variables. Get references to the DOM elements that will be used by the app.

<!-- > -->

```JS
// Display messages from the websocket
function showMessage(message) {
  messages.innerHTML += `${message}\n\n` // display the message
  messages.scrollTop = messages.scrollHeight // scroll to the top
  messageInput.value = '' // clear the input field
}
```

This function will be used to display messages that come in from the websocket connection. 

<!-- > -->

```JS
function init() {
  // Clean up before restarting a websocket connection
  if (ws) {
    ws.onerror = ws.onopen = ws.onclose = null;
    ws.close();
  }

  // Make a new Websocket
  ws = new WebSocket('ws://localhost:6969')

  // Handle the connection when it opens
  ws.onopen = () => console.log('!Connection opened!')

  // handle a message event
  ws.onmessage = (e) => showMessage(JSON.parse(e.data))
  
  // Handle a close event
  ws.onclose = () => ws = null

}

// Handle button clicks
sendBtn.onclick = function () {
  // Send a message
  if (!ws) {
    showMessage("No WebSocket connection :(");
    return;
  }

  ws.send(messageInput.value);
  showMessage(messageInput.value);
}

init();
```

The three blocks of code here: 

- Initialize the websocket connection
- Handle clicks on the send button 
- Call the init function

<!-- > -->
Looking at the init function the following things happen: 

- Check if there is a websocket object
  - If there is clear it's listeners
  - and close the connection
- Create a new websocket listening on port 6969
  - Notice we use the ws:// protocol
- Listen for an `onopen` event
  - This is handled here by logging a message
- Listen for onmessage.
  - This where we receive a message from the server 
  - data from the server is attached to the event object
- Listen for a a close event 
  - This will tell us if our socket connection was closed
  - Clean up the `ws` object

<!-- > -->

Take a look at the `sendBtn.onclick`. This function is responsible for sending data to the websoscket server. 

- First check there is a `ws` 
  - If not show a message 
  - and exit
- Put a data object together with a name and message
- use the `ws` to send the message object.
- Show this message in this client

<!-- > -->

### Websocket Challenges

<!-- > -->

**Challenge 1 - Implement and test websocket example**

Implement the code above and test your code.

- launch the server with `node server.js` or `nodemon server.js`
- Open `index.html` in *two* windows or tabs
- Sending a message from on of the tabs/windows should display that message in both windws. 

Every tab/window running the client should get messages broadcast by the server.

<!-- > -->

**Challenge 2 - Mod the client**

Here the client is made up of a couple functions:

- `init()` - initializes the web socket 
- `showMessage()` - displays a new line of text

Currently the text displayed is just added to the `innerHTML` of the `messages` element. Wrap the message in an html tag. 

- Wrap the message in the list element `<li>` and `</li>`
- In `index.html` change the `<pre id="messages">` to `<ul id="messages">`
- Stretch goal: Add some more formatting or styles for messages...

<!-- > -->

**Challenge 3 - Mod the client**

Let's mod the client and include a name with each message. 

- Add a input field to add a name. 
	- `<input type="text" id="input-name">`
- Create a reference to the new element
	`const nameInput = document.querySelector('#name-input')`
- When sending the message you need to send both the name and the message. You can do this one of two ways. In both cases you'll be modifying the data that is sent to the websocket. This appears on the last line. 
	1. Combine both the name and message into a single string. 
	2. Send an object with two fields. This solution will require that you modify the show message function since `message` would now be an object. 
- Show the name before the message.  

To solve this problem you will have to convert the data sent to the server to JSON and parse the JSON from the server back to JS. The data field is always a string for websockets! 

This means at the send button: 

```JS
// Create an object:
const data = { message: messageInput.value, name: nameInput.value }
// Convert to JSON to send to server
ws.send(JSON.stringify(data))
showMessage(data)
```

When receiving data you'll need to parse the JSON into JS: 

```JS
showMessage(JSON.parse(e.data))
```

The ouptut should look something like: 

```
Andy: Hello
Bob: World
```

**Challenge 4 - Style the client**

Style your client. The client has basic styles but you can do more! Here are a few ideas: 

- Style incoming messages with different color from messages that orginated in the client. 
  - An easy way to handle this would be to tag messages with a class name. 
  - You can align incoming messages on the left and outgoing messages on the right. 
- Add some general styles to the app. 

**Challenge 5 - Add a date**

Add the date and or time to a message. Would be good if the messages had a time stamp. 

- Before sending a message use `Date.now()` to get the UTC value. 
  - You can do this from the client or the server. 
- Send the UTC as part of the data object. 
- On the client side turn the UTC into a new Date object and extract the date, day, hours, minutes, seconds etc. 
- Display the date along with the message. 

<!-- > -->

### Websocket Resources

- https://github.com/websockets/ws
- Simple Websocket example in JS: https://dev.to/karlhadwen/node-js-websocket-tutorial-real-time-chat-room-using-multiple-clients-24ad

<!-- > -->

## After Class 

<!-- > -->

- Finsih the challenges here and submit your work to GradeScope
- Finish up the outstanding hoemwork projects and submit those to GradeScope.

<!-- > -->

### Evaluate your progress

1. Describe Subscriptions
1. Describe Websockets
1. Implement a websocket 
1. Implement a websocket client

| - | Does not meet expectations | Meets expectations | Exceeds expectations | 
|:---:|:---:|:---:|:---:|
| Conprension of Subscriptions | Can't explain GraphQL subscriptions | Can explain GraphQL subscriptions | Could teach the basics of GraphQL subscriptions to another student |
| Websockets | Can't describe websockets | Can describe websockets | Could describe uses cases for websockets |
| Implementing websocket server | Can't implement a simple web socket | Can implement a websocket server | Could expand upon the challenge solution server |
| Create a Websocket client | Can't create a simple websocket client | Can create a simple websocket client | Could expand on the challenge solution |

<!-- > -->

## Resources

<!-- > -->

1. https://github.com/websockets/ws
1. Simple Websocket example in JS: https://dev.to/karlhadwen/node-js-websocket-tutorial-real-time-chat-room-using-multiple-clients-24ad
1. https://github.com/prisma/studio