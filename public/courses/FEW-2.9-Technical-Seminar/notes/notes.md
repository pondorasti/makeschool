
Assignments 

- GraphQL Query challenges SWAPI
- Write your own Express graphQL Server challenges 
- OpenWeatherMap graphQL API
- 










**** Old Notes ****

Intro

- Are the students already familiar with REST/HTTP? If so, I’d do the REST vs GraphQL part even before the benefits. If students are not yet familiar with REST, maybe leave the comparison out altogether? I think the comparison with REST can be a super helpful tool in explaining how GraphQL works, but if the students don’t know REST it would be somewhat pointless. (Although I’d assume most students are familiar with REST?!).
- What are you planning to teach under “Vocabulary”? I don’t think I’d start with a section that tries to map out all terms/concepts upfront but rather introduce students to these concepts as they go and they need them (I’m thinking about things like schema directives, subscriptions, enum types, …). For the beginning I wouldn’t start with more than “schema”, “query” and “mutation” and the core concepts to be taught in the intro.
- Great idea to include the GitHub API! Be aware that the API is sometimes not super intuitive to use (e.g. because it’s using the Relay-style pagination that traverses relations via the edges and node fields which is not very intuitive at first). Might be a good idea to think about a number of tasks upfront that the students should be accomplish when using the GitHub API. Otherwise it could be an idea to quickly spin up a Prisma GraphQL CRUD API that students can user to get familiar with queries and mutations.

Getting Started

- I think all the points in here can almost be included in the intro. I’d try to have a practical session at the end of the intro where the students explore writing GraphQL queries and mutations.
- Talking about passing arguments to queries might be helpful in this section though. 

GraphQL schemas

- For that topic, I highly recommend this article which I wrote roughly a year ago but which is pretty timeless because it really just talks about the foundation of GraphQL and no added pieces through any libraries. Writing the article took me several days but in the end I had a super good understanding of what GraphQL schemas actually are and how they work.
- I think it’s super important for students to realise the connection between the schema and the available API operations. When talking about schemas, you should also always include a discussion about resolver functions so that students get the connection between the schema definition and implementation.
- For the beginning, I’d recommend doing everything without a database and just store data in-memory.

some suggestions for projects the students can do during the term. 

- Simple projects could be to implement build a GraphQL API that includes authentication and authorisation logic (backend)
- Another idea could be to write a frontend application that talks to a GraphQL API (e.g. using Apollo Client)
- Really advanced students could try implementing their own GraphQL client library for React (similar to Apollo Client, Urql or Relay)

I hope that helps!

Definitely let me know if you have any further questions, I’ll try to respond quicker next time! You can also reach me on the Make School Alumni Slack (or you can join our Prisma Slack where I’m always online). If you feel a longer discussion could be helpful we can also jump on a quick call :)

Best wishes from Berlin,
Nikolas