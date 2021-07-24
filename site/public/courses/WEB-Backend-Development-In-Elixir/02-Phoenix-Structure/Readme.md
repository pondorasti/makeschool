# Anatomy of a Phoenix App

## Vocabulary

- Software Architecture
- Phoenix Contexts
- Domains
- Views
- Models
- Controllers
- Packages, Libraries & Package Managers


## Objectives

1. Understand the basic structure of a Phoenix app.
2. Explain the need for software architecture in context of a phoenix app.
3. Visualize the components that make a typical RESTful API run (Model, View, Controller) communication.
4. Understand the need for package manager and the HEX package manager.


## Types of Client - Server Communication

#### HTTP - REST

Typically, most web applications developed use the RESTful pattern of communication.
A client (Mobile, Web) sends a request through HTTP for a resource(a post, a timeline, a user's information), the client recieves this request, typically in a format known as JSON( aka JavaScript object Notation) and renders this information in the form of some User Interface (Native mobile or HTML web). 

***NB***: There are other formats for communication with a server, XML used to be widely popular at some point in time.

Clients construct these HTTP requests through special constructs like:

- Headers: which carry information about how a request should be recieved/handled.
- Body: This contains information about a resource that is about to be created in a POST/PUT/PATCH request.
- URL Parameters: This contains query information about a resource eg(I want a user with id: 1)



#### Websockets

Websockets allow for full duplex communication between client and server. Instead of the client making a network request and waiting on a response for the server, both client and server can push information back and forth to each other at any time.

This allows for all sorts of realtime applications to be developed like text/voice/video chats, group applications like simultaneous drawing etc.


There are all sorts of protocols that clients and servers can use to communicate, if both platforms support that particular protocol.


## A Typical Phoenix App

Phoenix apps


### Phoenix  Contexts
Starting from Phoenix 1.3, Phoenix introducted a new paradigm called *Contexts*. Contexts describe a resource bounded by some domain.



