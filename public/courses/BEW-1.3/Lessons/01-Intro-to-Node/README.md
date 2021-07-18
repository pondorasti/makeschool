# Day 1: Intro to Node and Express

> _Fast, unopinionated, minimalist web framework._

<!-- omit in toc-->
## ⏱ Agenda

1. [🏆 [05m] Learning Objectives](#%F0%9F%8F%86-05m-learning-objectives)
1. [📖 [15m] Node and Express](#%F0%9F%93%96-15m-node-and-express)
1. [💻 [50m] Activity: GIF Search](#%F0%9F%92%BB-50m-activity-gif-search)
1. [🌴 [10m] BREAK](#%F0%9F%8C%B4-10m-break)
1. [📖 [30m] Recap: Node & Express](#%F0%9F%93%96-30m-recap-node--express)
   1. [A Basic Server](#a-basic-server)
   1. [Writing a Route](#writing-a-route)
   1. [The `req` & `res` Variables](#the-req--res-variables)
   1. [Writing a Template](#writing-a-template)
1. [🌙 [05m] Wrap Up](#%F0%9F%8C%99-05m-wrap-up)
1. [📚 Resources](#%F0%9F%93%9A-resources)


## 🏆 [05m] Learning Objectives

By the end of this class, you should be able to...

1. Set up a fully functioning Node environment.
<!-- 1. Get to know basic aspects of the Javascript language. -->
1. Write a route using Node and Express.js.
1. Use the Handlebars templating language to pass data to a template.
1. Compare and Contrast Express routes with Flask.

<!-- ## ☀️ [10m] Warm Up: Install Node

Install [Node 14.15.4 LTS](https://nodejs.org/en/) from the Node website.

## 💻 [50m] Activity: Getting to Know Javascript

Basic tutorial: https://github.com/workshopper/javascripting -->

## 📖 [15m] Node and Express

Let's go over some definitions to get us started...

- [**Node.js**](https://nodejs.org/en/about/) is an open-source JavaScript runtime environment that executes JavaScript code outside of a browser.

- [**NPM**](https://www.npmjs.com/) is short for "Node Package Manager", and is used to download third-party packages for use with Node.

- [**Express**](https://expressjs.com/) is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications.

- [**Handlebars**](https://handlebarsjs.com/) is a lightweight templating language that works with Node and Express.

<!--
## 📖 [15m] Review of Pair Programming

Pair programming is useful because...

- It will train you to **ask better questions** and **work better on a team**.
- Research shows that the **fastest and most effective way** to learn something is to teach it.

In pair programming, there are 2 roles: **Driver** and **Navigator**. You should switch roles often (every 5-10 minutes).

The **driver** is responsible for...

- Typing the code
- Checking for syntax errors
- Asking questions whenever the next step isn't clear


The **navigator** is responsible for...

- Thinking of what to do next
- Explaining why to proceed a particular way
- Looking up documentation
- Checking for syntax errors

**Both programmers** in a pair should...

- Avoid trying to be 'right' - pick a direction and keep going!
- Intervene if your pair is quiet
- Communicate!!!
- Swap roles frequently
-->





## 🌴 [10m] BREAK

## 💻 [50m] Activity: GIF Search

Choose pairs randomly. You will work with your pair for the rest of class.

Open the [GIF Search tutorial](https://www.makeschool.com/academy/track/gif-search-app-ynu) and finish parts 1-4 (part 5 optional). As you work, discuss each step with your pair and make sure both partners understand before moving on.

You will submit the tutorial in Class 2. You may finish on your own (just make sure to `git push` before the end of class).


## 📖 [30m] Recap: Node & Express

### A Basic Server

This code will likely be the same for most projects you create. *You do not need to memorize this, but instead should reference past projects or tutorials.*

```js
const express = require('express');
const app = express();

const exphbs  = require('express-handlebars');

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');
```

### Writing a Route

We write routes in Express using `app.get`, `app.post`, etc.

```js
app.get('/greetings/:name', (req, res) => {
  // grab the name from the path provided
  const name = req.params.name;
  // render the greetings view, passing along the name
  res.render('greetings', { name });
})
```

### The `req` & `res` Variables

`req` = "Request".

- `req.query` - Access the **query parameters** passed in the URL's query string.
- `req.params` - Access the **route variables** passed in the URL. E.g. `/greeting/Meredith`

`res` = "Response".


### Writing a Template

Take a look at the template syntax for Handlebars for showing a list of songs. How is it different than Jinja (or Django) syntax? How is it similar?

```js
<ul>
  {{ #each songs }}
    <li>
      <a href="/song/{{ this._id }}">
        {{ this.name }}
      </a>
    </li>
  {{ /each }}
</ul>
```

## 🌙 [05m] Wrap Up

Finish the GIF Search tutorial before the start of next class. You may finish individually - just make sure to clone the repository from your pair before you leave class!

## 📚 Resources

[Express/Node Introduction](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction)
