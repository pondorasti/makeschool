# FEW 2.4 Class 1 - Native Applications with JavaScript

## Introduction

The purpose of this class is to expand your JavaScript skills by exploring native applications built with JS. 

## Your Goals

Goals - 

Two goals will bring you success: building portfolio projects and mastering learning objectives. 

During this class, you will build two portfolio projects that show off your front end skills. I will present ideas and projects, you need to take them to completion.

If you have ideas that are outside the description of the project talk to the instructor. We will always be willing to work with you. My only request will be the projects include the learning objectives and the scope of the project to be reasonable.

What are the learning objectives? 

I’ll present ideas in class and give them a descriptor. These are learning objectives, concepts, and ideas that you need to know to claim mastery of the subject. Learning Objectives are often skills that are related to success at job interviews and on the job. 

When you understand a learning objective you will be able to explain it and put it into practice. There will be learning objectives for each class. You should test your knowledge by explaining the concepts to someone else. Implement the learning objectives in code when the learning objectives are code. Some objectives are larger overarching concepts, in these cases, you should identify the learning objective in your code, your project as a whole, or in the larger software ecosystem or the world at large. 

If you are having trouble understanding a learning objective you need to take action. Discuss the topic with another student, talk with a TA, bring questions to the class, talk to an instructor during lab or office hours. 

## Learning Objectives

1. Define Components with Class and function syntax
    - Component Architecture
    - Props and State
    - JSX
1. Compare and contrast Web and Native Applications 
1. Compare and contrast Mobile vs Desktop experiences 

## Initial Exercise

- Discussion: 
    - What is native?
    - Native vs Web
        - What makes a good native app? 
        - What makes a good web app? 
    - Desktop vs Mobile? 
        - What makes a good desktop app?
        - What makes a good mobile app?

### WHat would make a good native app?

Think of some ideas for native apps:

- Games
- Chess timer
- Chess Board

## Why Learn React? 

React is one of the most popular libraries around today. Seriously, you should know it! React is good to learn now since it has huge and well-deserved popularity.

[Hacker News Hiring Trends: React, Vue, Angular, Angular 2](https://www.hntrends.com/2020/dec-year-unlike-any-other-tech-tools-didnt-change-much.html?compare=React&compare=Angular+2&compare=Vue&compare=)

[NPM Downloads: React, Vue, Svelte, Angular](https://npm-stat.com/charts.html?package=react&package=vue&package=angular&package=Svelte&from=2016-06-01&to=2018-05-31)

Here is a good look at the reasons to learn React, Vue, or Angular. 

[https://levelup.gitconnected.com/angular-vs-react-vs-vue-which-is-the-best-choice-for-2020-81f577697c7e](https://levelup.gitconnected.com/angular-vs-react-vs-vue-which-is-the-best-choice-for-2020-81f577697c7e)

Check out the state of JavaScript 2019:

[State of JS 2020](https://2020.stateofjs.com/en-US/)

Looks to me like it's a good time to learn React. That said, it won't be here forever and you are capable of learning any framework. React is a good place to invest your time right now.

## React Redux Review

React seems to be a popular tool, it can also be used to make native mobile applications. This makes it a good choice for this class. 

Native applications hold and manage their own data. We need a tool and a strategy for this! I'm going to propose Redux. You've used it before, it's mature and popular. 

Let's answer a couple questions about redux. 

Why use Redux? Is redux still used in 2021? Can't you replace Redux with one of those new hooks?

https://dev.to/alexandrudanpop/why-react-projects-still-use-redux-in-2020-395p

### You need some practice to get back into this!

Build a Cookie Clicker in class?

- What is a [clicker](https://en.wikipedia.org/wiki/Cookie_Clicker)? 
- [Universal Paper Clips](http://www.decisionproblem.com/paperclips/)
- [Break Down Clicker games](https://allbitsequal.medium.com/taking-games-apart-how-to-design-a-simple-idle-clicker-6ca196ef90d6)
- [Incremental Game Math](https://gamedevelopment.tutsplus.com/articles/numbers-getting-bigger-the-design-and-math-of-incremental-games--cms-24023)

Redux would be a great way to create a complex cookie clicker game.

Build the following components

- Counter Display
- Counter 
    - Button add to count
    - Upgrade button
- Auto Counter
    - Upgrade button

- import dependencies `npm install redux react-redux`
- create actions
- create reducers
- Setup the store and provider component

**Challenges: Clicker**

Try and solve these challenges with the clicker game. 

- Create a component that counts with each click "Clicker". 
- Create a button that adds a new "Clicker". 
- Create a component that displays the total clicks from all clickers. 
- Create a bigger clicker. This should add more than 1 with each click. Each click could be 5, 10, 25, 50, or 100. You can use a component and configure it with props to set the amount. 
- Create an "AutoClicker". AutoClickers count without a manual click. Use `setInterval`
- Create a button that "buys" an auto clicker for 10 clicks. Clicking this should subtract 10 from the total and add an auto clicker.


## After Class

- [Assignment 1 - React Redix Tutorial](../Assignments/Assignment-1-react-redux.md)

## Additional Resources

- [Hacker News Hiring Trends: React, Vue, Angular, Angular 2](https://www.hntrends.com/2018/jun-no-signs-of-slowing-for-react.html?compare1=React&compare2=AngularJS&compare3=Angular+2&compare4=Vue)
- [NPM Downloads: React, Vue, Angular, Angular 2](https://npm-stat.com/charts.html?package=react&package=vue&package=angular&package=angular%202&from=2016-06-01&to=2018-05-31)
- [React](https://reactjs.org)
- [Redux](https://redux.js.org)
- [Incremental (Clicker) Games](https://en.wikipedia.org/wiki/Incremental_game)
- [Universal Paperclips](http://www.decisionproblem.com/paperclips/)
- [Password App](https://github.com/MakeSchool-Tutorials/web-7-react-redux-passwords-app)
- [Timers App](https://github.com/MakeSchool-Tutorials/web-7-react-redux-timers-app)
- [Tetris App](https://github.com/MakeSchool-Tutorials/web-7-react-redux-tetris-app) 
