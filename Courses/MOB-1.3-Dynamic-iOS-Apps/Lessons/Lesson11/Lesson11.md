# Sockets

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:10      | Socket io                 |
| 0:15        | 0:40      | In Class Activity I       |
| 0:55        | 0:10      | BREAK                     |
| 1:05        | 0:35      | In Class Activity I       |
| 1:40        | 0:05      | Wrap Up                   |
| TOTAL       | 1:45      |                           |

## Why you should know this



## Class Learning Objectives/Competencies (5 min)

By the end of this class, you should be able to...
- Identify the relationship between client and server when establishing a socket connection.
- Review the use of delegates, when passing data through views.
- Implement real time messaging within your an app.

## Socket io (10 min)

At this point we know how to use URLSession to make HTTP requests. We get JSON back and handle the response. Everything is good so far and we can get the information we need by calling the appropriate endpoints. But what happens if we want the server to communicate something to our client app? Let's say we want to have our data in the app always up to date. How can we achieve that? One thing we could do is checking with the server every now and then to see if there has been any updates to the data. But that's not a very good solution since we can't be making endless network requests just in case something changes.

A better way of communication in these type os situations is using streams.  Sockets are the solution when it’s necessary to receive data from a server instantly, for example when there is new data available or when data has changed. This is possible without having the app send requests to the server.

Socket.IO is a JavaScript library for real-time web applications (instant messengers, push notifications, online gaming).

Sockets are a popular solution for most real-time systems. They provide a bi-directional communication channel between a client and a server. This means that the server can push messages to all connected clients

## In Class Activity I (75 min)

Follow this in-class [tutorial on sockets](https://github.com/matthewharrilal/Make-ChatRooms-Tutorial). If you get blocked at some point ask instructor for help with clarifying questions.

## Wrap Up (5 min)

- Complete today's activities.
- Keep working on your project.

## Additional Resources
- [Socket.io - article](https://medium.com/cr8resume/working-with-socket-io-in-ios-swift-3-ca1cb5153576)
- [Socket io site](https://socket.io)
- [Socket io client for Swift](https://github.com/socketio/socket.io-client-swift)
