<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Model, View, Controller


<!-- > -->

## Agenda

1. Submit GIF Search [5 mins]
1. Essential Question & Discussion [15 mins]
1. Model, View, Controller [20 mins]
1. Activity [40 mins]
1. How Flask works / Quiz review [25 mins]

<!-- > -->

## Submit GIF Search

Visit [make.sc/submit-gif-search](http://make.sc/submit-gif-search) to submit.

<!-- > -->

## Essential Question

How do pages on the Web communicate with each other?

<!-- v -->

## Think, Pair, Share [15 mins]

Let's say I go to Amazon.com, search for an item, and put it into my shopping cart.

*How* does this happen? If Amazon were an app written in Flask, what would it look like? Write down *everything* you know.

<!-- > -->

# Model, View, Controller

<!-- v -->

## Overview

When we write code for a web server, we typically use a convention known as **Model, View, Controller**.

![Restaurant](assets/restaurant.png)

<!-- v -->

## Controller

The **controller** is like the waiter.

In our Flask application, the **controller** is the routes contained in `app.py`.

![Waiter](assets/waiter.jpeg)

<!-- v -->

## View

The **view** is like the menu.

In our Flask application, our **views** are the HTML pages. 

![Menu](assets/menu.png)

<!-- v -->

## Model

The **model** is like the food!

In our Flask application, the **model** is the data being passed back and forth between the client and server.

![Food](assets/food.png)

<!-- > -->

## Activity

1. What are the Model, View, and Controller, and what do they represent in our Flask app? Make sure each person understands before moving on.
1. Choose a website that you use frequently and at least one way you interact with that website. Ex: Searching for cat videos on YouTube.
1. Decide who will be the Model, View, Controller, and User. Write a short skit and have each person act out their role.
1. Practice your skit!

<!-- > -->

## Review

Let's review the Dice Game activity [here](https://github.com/Make-School-Courses/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/tree/master/Examples/DiceGame/05-Unit-Tests).

<!-- > -->

## Playlister Tutorial

Check out the tutorial here: make.sc/playlister

Due Thurs, Sept. 26

<!-- > -->

## Announcements

Quiz on Tuesday, Sept. 24 covering APIs, `curl`, `requests`, and testing