---
title: "1. User Narratives, Wire Frames, and Technical Planning"
slug: technical-planning
---

This tutorial is part of a four part series with the [Giphy Search Tutorial](https://www.makeschool.com/academy/track/standalone/gif-search-app-ynu/your-node-environment), the [Concentration Game](https://www.makeschool.com/academy/track/standalone/javascript-concentration-game/JavaScript-game-Tutorial-intro), the [Rotten Potatoes Tutorial](https://www.makeschool.com/academy/track/standalone/rotten-potatoes---movie-reviews-with-express-js/start-an-express-project). Whereas those tutorials gave you 100% of the code or starter code you needed to build them, this project will be more demanding of you to write your own code, or find the proper code snippets from your other projects and framework documentation.

In this tutorial you will develop a clone of Reddit with posts, subreddits, and authentication. The tools you will use are:

1. Node.js
2. Express.js
3. MongoDB & Mongoose (ODM)
4. JSON Web Tokens (JWT)

This tutorial should take much longer than the previous tutorials to complete and it will require that you read instructions very carefully and follow them step by step. You might encounter errors that you will need to troubleshoot and google to solve. If you would like to provide feedback on this tutorial, please leave GitHub issues on the [GitHub repo](https://github.com/MakeSchool-Tutorials/Node-Reddit-Clone).

## Why is this important?

When you're building large scale applications, it's good to have some practice with the tools that enable you to spin things up quickly. Trying to do everything using vanilla code, while commendable, can be incredibly time consuming. Knowing which frameworks and tools to use to get everything up and running will make your life significantly easier when you're doing this in the industry. We'll also cover how to do an auth flow using [JWTs](https://jwt.io/), an incredibly popular tool to use for auth that you'll be able to transfer over to any time you want to put an auth flow in your app!

## Learning Outcomes

By the end of this tutorial, you should be able to...

1. Implement a large scale application using Express, Handlebars, and MongoDB/Mongoose
2. Implement an authentication flow through [JWTs](https://jwt.io/) that allows users to sign up, log in, and log out, and restricts functionality based on authentication status
3. Investigate how to use the [populate](https://mongoosejs.com/docs/populate.html) method in Mongoose for advanced associations
4. Implement more intricate tests for CRUD apps as well as for authentication flows.

## Tutorial structure

This tutorial will walk you through a pattern of "user-centered" or outside-in development with route tests, meaning you will first develop a simple template for a route, then it's actual backend logic. By following this pattern, software is built step-wise and organically without leaps or guesses. This avoids large architectural bugs which are the biggest drain on the speed of a development team.

As you build, keep in mind the rules of a good user interface. Review those here: [goodui.org](http://goodui.org/).

## Using Git/GitHub

As you go through this tutorial, you will also be making commits after completing milestones. **This is a requirement, you must make a commit whenever the tutorial prompts you**. This not only further enforces best practices for software engineering, but also will help you more easily figure out where a bug originated from if you break your progress up into discrete, trackable chunks.

When prompted to commit, you'll see a sample commit message. Feel free to use your own message, so long as it clearly and concisely covers the work done.

Lastly, the commit prompts in this tutorial should be the **minimum** amount of times you commit. If you want to do more commits, breaking your chunks into even smaller chunks, that is totally fine!

## Getting Started: User Narratives & Wireframes

If you are not familiar with [Reddit](https://www.reddit.com/), navigate there now and explore this internet wonderland. Check out its [history](https://en.wikipedia.org/wiki/Reddit#History) if you like. It was founded by Alexis Ohanian --- now an investor in Make School. Sweet!

While you're there, draw a wireframe of each page on some scratch paper. The basic layout contains two navbars (one for subreddits, and one for sorts/filters) and a two column layout in a proportion of about 10:2, with no side gutters or padding.

## Technical Planning

Now it's time to get started by making a step-by-step plan. Here are some of the routes and features we could build:

- Create a post
- Show all posts
- Comment on posts
- Make comments on comments
- Sign up
- Login
- Associate posts, comments, and votes with their author
- Search
- Create subreddit
- Create a post on a subreddit
- Show all subreddits
- Vote a post up or down

In what order should we fulfill these tasks? What do you think? Write it down step by step somewhere. When you are done, hover over the solution to see what order these tasks are implemented from within this tutorial.

:::solution

We should work from the fundamental to the desirable --- the structure of our program comes first, then any nice-to-haves. Generally, it's best to delay the implementation of authentication as that can cause some initial complexity; we'll do authentication in the middle. Voting could come sooner or later; we put it at the very end. Until that point, we'll have a somewhat-themed Twitter or Facebook wall... until there is voting and sorting on votes, that is!

1. Create a post
2. Show all posts
3. Comment on posts
4. Create subreddits
5. Create a post on a subreddit
6. Show all subreddits
7. Sign up and Login
8. Associate posts, comments, and votes with their author
9. Make comments on comments
10. Vote a post up or down

:::

## Starting Express.js

Ok --- we've got user narratives, wireframes, and a plan for the first few features to implement. Time to get started coding! Remember not to "work ahead", instead always do the absolute minimum work to get what you are working on to function and then move to the next.

Follow this video for how to setup an Express.js project with Handlebars:

![ms-video-youtube](https://www.youtube.com/watch?v=41PToE2zYGY&t=3s)

1. Create an npm project (hint: `npm init`) - remember to make your main file called `server.js`. Use the express documentation or a previous project to set up the boilerplate code for the server.
2. Start Express.js. You can use Handlebars or Jade as a templating engine if you like. **This tutorial will use Handlebars**. Should you use Handlebars, you should make sure that `express-handlebars` is installed. Navigate to [express-handlebars](https://github.com/express-handlebars/express-handlebars) and read the **Usage** documentation for how to do this.
3. Run your server with `nodemon` and see that your `home.handlebars` and `layout.handlebars` templates are working and displaying correctly.
4. Add Bootstrap to your layout template `<head>` using the CDN. Use the following [starter template](https://getbootstrap.com/docs/5.0/getting-started/introduction/#starter-template) as a guide for your own!

> [action] Create a `views` folder and in there we can create a `main.handlebars` file that will serve as our base.

> ```html
> <!DOCTYPE html>
> <html lang="en">
>   <head>
>     <meta charset="utf-8" />
>     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
>
>     <link
>       href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
>       rel="stylesheet"
>       integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
>       crossorigin="anonymous"
>     />
>
>     <title>Reddit.js</title>
>   </head>
>   <body>
>     <h1>Reddit.js</h1>
>
>     <script
>       src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
>       integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
>       crossorigin="anonymous"
>     ></script>
>   </body>
> </html>
> ```

1. Now add the [navbar component](https://getbootstrap.com/docs/5.0/components/navbar/) to your layout template.

## Product So Far

When you're done, you should have something like this to start off with:

![FINISHED CHAPTER 1](assets/ch1-done.png)

Not very great looking, but it's a fantastic start!

Now that you have a basic initialized project, let's commit to GitHub.

```bash
$ git init
$ git add .
$ git commit -m 'node reddit clone project init'
```

Now go to GitHub and create a public repository called `Node-Reddit-Clone`, and now associate it as a remote for your local git project and then push to it.

```bash
$ git remote add origin GITHUB-REPO-URL
$ git push origin master -u
```

Onwards!
