# Redux Intro 

What is Redux and why you should care.

## Single Page Applications 

In __mulitpage__ applications application state is stored on the server and data
is sent to the browser with each refresh. 

__SPA__s (or Single Page Applications) are applications that run in the browser. 
Usually written in JavaScript. They act as a full featured multi-screen 
application while not actually refreshing the browser. These apps 
present themselves as mulitpage apps but are really just a single page. 

## Application State 

Application state is data that is represented by content and 
information show in the UI. 

Often the same data is displayed in different ways. Pieces of 
data might appear in different ways at different locations on 
the same screen. It may also appear differently on different 
screens.

Discuss with a partner application state. Use examples from projects you 
have built. Also, consider published applications that you use every day. 
Consider important pieces of state, it's type, and how it is updated. 

- 3 examples of application state from your projects
  - Inlcude the data types 
  - Where does this data appear in your project
- 3 examples of application state from published applications
  - Inlcude the data types
  
## Class work 

You will be responsible for three projetcs this term. Two fo the projects 
will come with a specification that will be your goal ot meet. The third 
project is a project of your own design. 

All three of these projects must use React/React Native and Redux. 
  
### Timers Project

This project creates a list of free running timers. 

It must store a list of timers. Each timer can be run and stopped 
and keeps a cumulative time. 

This app could be used to track time spent on freelance or personal projects, 
used in tracking scientific experiments, or any number of uses that involve 
tracking time for any number of activities. 

- Keeps a list of timers
- Each timer might be running or paised
- Timers displays total time a timer has been running

Imagine you need to store data to make the timers project work. 
What would this data look like?

Discuss __state__ you might use for the timer project. 

### Passwords project 

The premise of the project is a utility that generates passwords 
and stores them. 

People often have many passwords to remember, and are often 
required to make up new passwords. Weak passwords are the bane of 
modern life. A utility that can generate and store passwords might 
be useful. 

Imagine this project as a utility application that can do the 
following: 

- Generate a random password using several methods.
- Save a list of passwords with some notes. 
- Edit and Delete passwords that have been created.

## Class projects 

Below are detailed specs for the class projects you are each 
responsible for creating these projects __before__ the end of 
the term. 

- [Project 1 - Tmrz](../project-tmrz) 
- [Project 2 - Pswrdz](../project-pswrdz)
- [project 3 - Custom](../project-custom)

### Twitter's store...

Here is a an article by someone who disected Twitter's Redux store. 

https://medium.com/statuscode/dissecting-twitters-redux-store-d7280b62c6b1

## Homework

Watch these videos and be prepared to discuss the concepts presented.

- Simple made Easy - https://www.infoq.com/presentations/Simple-Made-Easy
- The value of values - https://www.youtube.com/watch?v=-6BsiVyC1kM

## Time line

| Time |      | Activity     | Description |
|------|------|--------------|-------------|
| 10min| 10min| Talk         | Intro |
| 10min| 20min| Think Pair   | Discuss with a partner application state |
| 10min| 30min| Talk         | Class project Timers |
| 10min| 40min| Think pair   | Discuss state for Timers |
| 10min| 50min| Present Ideas| Present and whiteboard ideas |
| 10min| 60min| Think pair   | Passwords project |
| 10min| 70min| Present Ideas| Present and whiteboard ideas |