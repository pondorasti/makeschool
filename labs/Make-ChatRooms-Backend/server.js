var server = require("express")();
var http = require("http").Server(server);
var io = require("socket.io")(http);
var localStorage = require("localStorage");

server.get("/", (req, res) => {
    res.send("You have reached the default route for the Make-ChatRooms Backend!")
});

io.on('connection', function (socket) {
    console.log("New User Has Connected!") // Outputted to terminal to notify you that a new user has connected

    socket.on('chat message', function (message) { // Listening for an incoming chat message
        username = getKeyByValue(localStorage, socket.id)
        parsedMessage = JSON.parse(message) // Converts message JSON string into a JSON Object

        console.log("Incoming Message -> ", parsedMessage)
        console.log("Message sent from -> ( ", username, " ", socket.id, ")")
        socket.broadcast.to(parsedMessage.roomOriginName).emit('chat message', message) // Broadcasts message to everyone in the room that the message was sent from except the sender
    });

    // Listening for when the client sends in a username for the given socket connection!
    socket.on("socketUsername", function (username) {
        console.log(username + " is the username being sent!") // Outputted to terminal

        socket.nickname = username // Assigning the socket nickname to be the username that the client passes

        // Checking if username is already present
        if (localStorage.getItem(username)) {
            console.log("Someone currently connected to the server shares the same username!")
            socket.emit("usernameCollision", username)

        } else { // If we don't see the username
            localStorage.setItem(username, socket.id) // saving the item in local storage

            // Emit that the username chosen because it is a successful username
            socket.emit("validUsername", username)
        }
    });

    // Triggered when a user wants to create/join a room
    socket.on("joinRoom", function (roomName) {
        console.log(socket.id + " has joined the room " + roomName)
        socket.join(roomName)

        io.of("/").in(roomName).clients((error, clients) => {
            if (error) {
                console.log(error)
            }
            for (i = 0; i < clients.length; i++) {
                client = clients[i]
                console.log(" " + " Clients connected " + getKeyByValue(localStorage, client))
            }
        })
    });

    // Triggered when client wants to leave the room they are currently connected to
    socket.on("leaveRoom", function (roomName) {
        console.log("Leaving room " + roomName)
        socket.leave(roomName);
    });

    // Triggered when the user disconnects and their socket connections gets disbanded!
    socket.on('disconnect', function () { 
        console.log("User has disconnected!") // No special teardown needed on our part

        username = getKeyByValue(localStorage, socket.id); // Fetch the username associated with the socket connection

        localStorage.removeItem(username) // Remove that key value pair and print the local storage after the key value pair has been removed
        console.log(localStorage)

    });

});


function getKeyByValue(object, value) { // Helper function to find username given the socket id or connection
    return Object.keys(object).find(key => object[key] === value);
}


http.listen(4000, function () { // Begin listening on the port 4000 when the server is ran!
    console.log("Listening on port 4000")
});