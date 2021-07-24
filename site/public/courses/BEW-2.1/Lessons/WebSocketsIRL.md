<!-- Run this slideshow via the following command: reveal-md README.md -w -->
<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Day 7: Working with WebSockets

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda

1. [[**20m**] ☀️ **Warm Up**: WebSockets vs. HTTP](#20m-%E2%98%80%EF%B8%8F-warm-up-websockets-vs-http)
1. [[**30m**] 💬 **TT**: WebSockets In Depth](#30m-%F0%9F%92%AC-tt-websockets-in-depth)
   1. [Without WebSockets](#without-websockets)
   1. [Advantages of WebSockets](#advantages-of-websockets)
   1. [Disadvantages of WebSockets](#disadvantages-of-websockets)
   1. [Modern Alternatives to WebSockets](#modern-alternatives-to-websockets)
1. [[**15m**] 🌴 **BREAK**](#15m-%F0%9F%8C%B4-break-docsify-ignore)
1. [[**60m**] 💻 **Activity**: Tutorial and Challenge Time](#60m-%F0%9F%92%BB-activity-tutorial-and-challenge-time)
1. [[**05m**] 🔄 **Recap**: Today's Takeaways](#05m-%F0%9F%94%84-recap-todays-takeaways)

<!-- > -->

<!-- omit in toc -->
## 🏆 Objectives

1. Compare and contrast WebSockets with alternative ways to update web pages asynchronously.
1. Break down a classic WebSocket implementation into it's individual parts.
1. Apply WebSockets to a scenario of the student's choosing.

<!-- > -->

## [**20m**] ☀️ **Warm Up**: WebSockets vs. HTTP

First, take `10` minutes to read this excellent article: [HTTP vs Websockets: A performance comparison | by David Luecke | The Feathers Flightpath](https://blog.feathersjs.com/http-vs-websockets-a-performance-comparison-da2533f13a77), then write down and share your answers to the following questions in breakout groups:

1. At what total did the HTTP benchmark top out at?
1. At what total did the WS benchmark top out at?
1. What is different about WebSockets that would allow for two drastically different benchmarks? Answer in your own words!

<!-- > -->

## [**30m**] 💬 **TT**: WebSockets In Depth

The WebSockets protocol ushered in a new era of real-time communication, collaboration, and interactivity on the Web.

Let's explore some other ways we achieved similar results back in the old days!

<!-- > -->

### Without WebSockets

Before the protocol existed, web developers used the following tricks to mimic two way communication between the client and server.

<!-- > -->

#### Short Polling

**Short Polling** is a looping technique written in client side JavaScript.

Think of it like a timer that goes off every 10 seconds.

After the timer goes off, we check for new messages we may have received in the last 10 seconds between requests.

 Once we receive the response, we can immediately update the page with the result --- _even if there are no messages_.

Furthermore, your server will be bombarded with requests every 10 seconds, even if the user is doing something else, fell asleep, or walked away from their computer.

- Can you think of any **advantages** to this?
- Any **disadvantages?**


<details>
  <summary>Click to reveal answers</summary>

  1. Polling responses can’t really be in 100% real time and in sync
  1. Polling requiring 3 round-trips _(TCP SIN, SSL, and Data)_
  1. Timeouts _(Connection getting closed by the server if idle too long)

</details>

---

#### Long Polling

**Long Polling** is implemented similarly --- but has a distinct advantage. Long polling delivers messages without a delay, _and_ can detect scenarios where the client disconnected but still has the browser open!

![Image via WikiPedia](https://javascript.info/article/long-polling/long-polling.svg)


##### Workflow _<small>([source](https://javascript.info/long-polling#long-polling))</small>_

1. A request is sent to the server.
1. The server doesn’t close the connection until it has a message to send.
1. When a message appears, the server responds to the request with it.
1. The browser makes a new request immediately.
1. The situation when the browser sent a request and has a pending connection with the server, is standard for this method.
   - Only when a message is delivered, the connection is reestablished.
   - If the connection is lost, because of, say, a network error, the browser immediately sends a new request.

```js
async function waitForDataFromServer() {
  let response = await fetch("/updates");
  let elementToUpdate = document.getElementById("#latest-updates");

  if (response.status === 200) {
    // Get and show the message somewhere in the DOM.
    let newData = await response.text();
    elementToUpdate.innerHTML("NEW: " + newData);

    // Call waitForDataFromServer() again to get the next message.
    await waitForDataFromServer();
  }
  else {
    // If the response contains an error, show the error text on the page.
    elementToUpdate.innerHTML("ERROR: " + response.statusText)

    // After the user responds to the alert, reconnect (in one second)
    await new Promise(resolve => setTimeout(resolve, 1000));

    // Once we've reconnected, listen for updates.
    await waitForDataFromServer();
  }
}

// Call the function when the page loads so we can listen for updates.
waitForDataFromServer();
```

Long polling works great in situations when messages are rare: every message is a separate request, supplied with headers, authentication, and so on. High traffic, combined with frequent messages, can slow down servers quickly.

In 2008, we welcomed the WebSocket standard to address these concerns!

<!-- > -->

### Advantages of WebSockets

- Allow for increased collaboration around the world.
- Enable increased interactivity in web applications and browser-based video games.
- Bi-directional, real-time communication.
- Can both send and receive data from the browser.
- Implementations generally do not use `XMLHttpRequest`, and as such, headers are not sent every-time we need to get more information from the server. reducing the expensive data loads being sent to the server.
- WebSockets can transmit both binary data and UTF-8.
- Can respond and invoke any number of custom events; event data can be sent or received by the client, the server, or both.
- Can be implemented in a secure fashion using WSS, which also improves the reliability of message receipt.

<!-- > -->

### Disadvantages of WebSockets

- Belong in apps that intend to persist over a lengthy session; might be overkill for small applications.
- Can fail in many corporate environments due to packet-inspecting firewalls and other malware blocking policies _(SophosXG Firewall, WatchGuard, McAfee Web Gateway)_
  - When connections are terminated, WebSockets don’t automatically recover.
  - This is something you need to implement yourself.
  - The reason why there are many client-side libraries in existence.
- Browsers older than 2011 don't support WebSocket connections.

<!-- > -->

### Modern Alternatives to WebSockets

For **one-directional** data, where you **need to update the client but not receive information in return**, you may opt for:

- HTTP Requests _(just like usual)_
- Server Sent Events (SSEs)
- REST Hooks
- [Amazon SQS: Message Queuing Service](https://aws.amazon.com/sqs/)

Many of these techniques are **quick to implement** and generally **more approachable to code** compared to WebSockets.

<!-- > -->

## [**15m**] 🌴 **BREAK** {docsify-ignore}

<!-- > -->

## [**60m**] 💻 **Activity**: Tutorial and Challenge Time

1. First, complete the Make Chat Tutorial
2. Then, complete the [WebSockets Challenge](Challenges/Websockets.md) for homework.
   - If you don't want to make a chat application again, that's OK!
   - Create any MVP that uses WebSockets to earn full credit!
   - Check out this [Whiteboard](https://socket.io/demos/whiteboard/) and the [socket.io/examples/whiteboard codebase](https://github.com/socketio/socket.io/tree/master/examples/whiteboard) for more inspiration.

<!-- > -->

## [**05m**] 🔄 **Recap**: Today's Takeaways

- WebSockets require an HTTP server (Express) and a WS server (SocketIO).
- WebSockets are generally used in conjunction with a web-based front end written in HTML / CSS / JS.
- Often, the same framework provides libraries that both the front and back end can utilize: SocketIO, SockJS, etc. These libraries can also patch a number of browser compatibility concerns.

<!-- > -->

<!-- omit in toc -->
## 📚 Resources & Credits

- [XMLHttpRequest](https://hpbn.co/xmlhttprequest/#xhrreq)
- [WebSockets for fun and profit - Stack Overflow Blog](https://stackoverflow.blog/2019/12/18/websockets-for-fun-and-profit/)
- [WebSockets vs Server-Sent Events | Ably Blog: Data in Motion](https://ably.com/blog/websockets-vs-sse)
- [Long Polling in JavaScript](https://javascript.info/article/long-polling/longpoll/)
- [Stop Polling and Consider Using REST Hooks | Nordic APIs |](https://nordicapis.com/stop-polling-and-consider-using-rest-hooks/)\
- [Using WebSockets on Heroku with Node.js | Heroku Dev Center](https://devcenter.heroku.com/articles/node-websockets)
