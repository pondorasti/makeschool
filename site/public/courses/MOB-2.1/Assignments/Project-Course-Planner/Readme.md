# Project - Course Planner

We will be building an app to help students manage courses they are taking.
As a user, I should be able to add a new course with a name and times classes occur(MWF). Course can have many **Projects**.

I should be able to add sessions to a class. Sessions are occurrences of a course(class).
Course Sessions can have many **Notes**. I can view the list of my notes for a particular class session, I can also add new notes.

I can view a list of my projects and add new projects with a name, due date and completions status(done or not done).


**Gist of Requirements**

- Sessions are occurences of Courses.
- Course can have many sessions. 
- Course Session can have many notes attached.
- Courses can have many Projects.
- Projects can be marked as completed or not and have a due date.


### Code Quality Requirements

You know how to store trivial information in Core Data. The purpose of this project is for you to develop a professional working application with Core Data. Think about your architectural choices and focus on code quality. 

Your code will be examined on these categories:

- Code modularizaton
- Commenting Code
- The use of simple abstractions
- Use of the Core Data Stack
- Performance of code
- Swift style guide & Tools (Protocols, Enums etc)

## Entities
- Course
    - Name
    - Meeting times (Monday, Wednesday, Friday(MWF) etc..)
    - Has many sessions
    - Has many Projects
- Session
    - Belongs to a Course
    - Has many Notes
- Note
    - Belongs to a Session
- Project
    - Belongs to Course
    - Completed property
    - Due Date property

## Requirements

- Use core data to store user's courses, course sessions and notes for each session.
- Read data from the main context and write on a private background context.

## UI

The interface is up to you to decide. I have provided a sample design, but you are free to experiment with your own interpretations.

![Sketch](sk.jpg)

## Extra Challenges

- Add a button to sort the notes of a session by date(asending/decending) order.
- Project reminder; send a local notification a few hours before a project is due.
- Use a markdown parser to find the course page for each class(on github) and display it as Syllabus.