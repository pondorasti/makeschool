# FEW 2.9 GraphQL React Lab

<!-- > -->

## Review 

Standup focussed on final project process: 

- What have you accomplished since Tuesday
- What are you going to accomplish between now and Next Tuesday?
- What are you going to work on in class today? 
  - What three things can you get done right now? 
- Do you have any blockers? 

## Tutorial Notes: 

React Apollo: Throughout the tutorial the author offers code a code snippet that requires a code snippet that comes later in the tutorial. Be aware of this! 

**React Apollo: Getting Started**

Error: "Argument id for data.postedBy.connect.id must not be null. Please use undefined instead.\n"

I skipped this error, it seems to be in Prisma. Could be due to update?

I continued to the next section and things seemed to be working.

**React Apollo: Mutations: Creating Links**

Error: Unhandled Rejection (Error): Argument id for data.postedBy.connect.id must not be null. Please use undefined instead.

Looks like the same error from the client side. 

I'm going to ignore it again seince authentication is not setup and I suspect it has something to do with that?

**React Apollo: Routing**

The routing worked, I was able to switch betwen the list of links and the create link form. The default links were showing in the list. 

Submitting a new link generated this error: 

Error: Unhandled Rejection (Error): Argument id for data.postedBy.connect.id must not be null. Please use undefined instead.

The next section is Authentication. I'll go through that and see if that fixes things if not? 

React Apollo: Authentication

At this point authentication seems to be working. 

The "New" link doesn't seem to be working. Not sure if I made a mistake. This could be handled in the next sections?

React Apollo: More Mutations and Updating the Store

I had errors all the way unitl the end of this section. Seems the code is presented first then an import statement is added after the code that uses the import. 

At the end of this section I was able to create new links! 

I did see this warning in the console: Warning: Can't perform a React state update on an unmounted component. 

React Apollo: Filter and Searching the list of links

At the end of this section the list of links was missing? Not sure if I did something wrong. 

When adding a new link I got an error in the client/browser but the link I added appeared in the database when I checked the server in Graphiql. Not sure what happened could be my fault. 

The search button did work...



<!-- > -->

## Resources

- https://www.howtographql.com/graphql-js/0-introduction/
- https://news.ycombinator.com
- https://www.howtographql.com/graphql-js/0-introduction/
- https://www.prisma.io
- https://github.com/apollographql/apollo-server/tree/main/packages/apollo-server

<!-- > -->

## After Class 

You should decide an what you are going to do for the final project

- React + Apollo Tutorial - Complete chapeters 7 and 8
  - [More Mutations and Updating the Store](https://www.howtographql.com/react-apollo/6-more-mutations-and-updating-the-store/)
  - [Filtering: Searching the List of Links](https://www.howtographql.com/react-apollo/7-filtering-searching-the-list-of-links/)
- GraphQL Node Tutorial - Complete chapeters 7 and 8
  - [Authentication](https://www.howtographql.com/graphql-js/6-authentication/)
  - [Realtime GraphQL Subscriptions](https://www.howtographql.com/graphql-js/7-subscriptions/)
- Your Custom project
	- Server - Solve problems and add subscriptions
	- Client - Add CSS!
- Stretch Challenge - React + Apollo tutorial chapters 
  - [Mutations: Creating Links](https://www.howtographql.com/react-apollo/3-mutations-creating-links/)
  - [Routing](https://www.howtographql.com/react-apollo/4-routing/)
  - [Authentication](https://www.howtographql.com/react-apollo/5-authentication/)
  - [More Mutations and Updating the Store](https://www.howtographql.com/react-apollo/6-more-mutations-and-updating-the-store/)
  
