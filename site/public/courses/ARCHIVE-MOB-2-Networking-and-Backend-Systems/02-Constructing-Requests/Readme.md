# Request Response Cycle - HTTP, URLs, REST

We are going to cover how information is transfered from a client(iOS, Web, Android etc) and a server. We will explore the modern 3 tier application architecture, and write a request from iOS to an web server on the internet.


## Vocabulary
- HTTP Verbs
- Network request/response
- Response status code
- Client and Server
- Serialization/Deserialization


## Objectives
- Construct network requests in iOS with URLSession, URLRequests.
- Identify what goes into a network request to fetch data(html, json).
- Learn to handle responses from network requests.
- Learn about serialization/deserialization


## Class Materials

Download and run this playground:

[Swift Playgrounds - URLRequests](Networking.playground)

[Networking Slides](client-server.key)

## Anantomy of an HTTP Request

**Group Activity:**

Write your home address out and diagram what each part is called.

**URL**

The web works with a series of unique addresses like the postal service. These addresses are called URLs or Uniform Resource Locator.

**Parts of URL**

![URL Parts](query.jpg)

URLs contain query parameters. These are key-value pairs that help us identify a specific resource or resources on a server. eg. Find the user who's email is "eliel@example.com" on the server called "www.apiserver.com" on the users resource.

*Translates to:*

www.apiserver.com/users?email=eliel@example.com

**Body**

When making a POST/PUT/PATCH request, we need to send data over to a server. We typically send them over in the body of the request.

**Headers**

Headers work like metadata for a request. They carry ansiliary information about a request. eg. Credentials, type of files being sent over to the server, the time the request was sent etc..
Common Headers include: 

- Content-Type: This is the type of information being sent over to the server. Eg. JSON is application/json

- Authorization: This carries credentials if needed for a request to complete. Some servers require an API Key or token to access certain content.

**Method - AKA HTTP Verb**

This describes the action to be performed on the server. GET gets a resource, POST creates a resources, PATCH/PUT change and existing resource, DELTE destroys a resource.

**Creating a request**

To create a request you will at least have to have the URL and the HTTP Method/Verb. Depending on the type of request you make (eg. A post request will need a body) you will need to fill in the other parts of a request(eg. Body, URL params)

## HTTP Response

After we send an HTTP request to a server, servers send back an HTTP response. 
The response also has a:
- Body: if response needs to send back a resource(data) usually sent as JSON
- Headers: Similar metadata to HTTP Request
- Status Code: This indicates what happens on the server.

Read this article on HTTP Status Codes:

[HTTP Status Codes](https://httpstatuses.com)

## Backend vs Frontend

Imagine a restaurant. You have the chefs and kitchen staff working behind the scenes to prepare and cook food. You have waiters and cashiers who interface with the customers. The waiters take food orders from the customer, send the food order to the kitchen staff who then make the food and send it to the front of house(waiters), the waiters who send the food to the customer. The kitchen staff is usually referred to as back of house. They are usually not visible to the customer. The waiters and cashiers are referred to as front of house. They interface with the customer.

In programming, the client is the front of house. Users/clients interface with a mobile app, website or other device. These clients speak to servers over the internet. The servers are the back of house. We call the server part, the backend.

Over the next 6 weeks will be building a mobile client, and a backend server to understand the complete request response cycle of HTTP.


## API's

**What is an API?**

Watch:

[What is an API](https://www.youtube.com/watch?v=s7wmiS2mSXY)


## Challenges

**Group Activity:**

1. Forms groups of two (2) and:

    - Diagram the request-response cycle
    - Answer the following questions:
        - What does REST stand for?
        - List out the HTTP action verbs. Which ones make changes to the state, and which ones do not?
    - List and categorize the HTTP Status Codes by:
        - Client Errors
        - Server Errors
        - Redirect Codes
        - Success Codes
        - Informational Codes
        
2. Complete Networking serialization/deserialization exercise from the playgrounds
    
    - Print out a specific value in the response JSON from a network request. eg. Poke API returns a list of pokemon. Print out the name of the first pokemon or any other attribute in the response JSON.
    
3. Practice making network requests with an HTTP Client
    
    - Download Postman - [Postman Link](https://www.getpostman.com)
    - Make a GET request to any API of choice
    - Inspect the parts of the request, and the response sent back
    - Make a POST request to an API that allows you to POST
