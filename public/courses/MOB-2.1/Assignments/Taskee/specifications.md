# Project - Taskee App

We will be building an app to help people manage projects. Each project will have a color and name associated with it, and can have any number of tasks. Each task will have a title, due date, and a status (TODO or DONE).

Think of this as building your own version of [Asana](https://app.asana.com/), the tool that Google, NASA, Spotify, Slack, and Make School use to keep their projects on track!

## Requirements

- Complete all user stories as defined in the User Stories section below
- Use Core Data for persistence.
- Follow code quality best practices as outlined in the Code Quality Requirements below
- Create two entities (Project, Task) as outlined in the Entities section below
- Include a GIF of your project demo in the `README` of your submitted project.
    - You can use a tool like [GIPHY Capture](https://giphy.com/apps/giphycapture), or [Video to GIF](https://imgur.com/vidgif)

## User Stories

As a user, I should be able to... 

- Add (Create) a new project with a name and a color for personal reference.
    - A **Project** can have multiple **Tasks**.
- Add (Create) tasks to projects with a title and an end date.
- Change the status of tasks From **TODO** to **DONE**
- View the list of TODO items inside a project (tasks that haven't been marked as DONE).
- View the list of DONE items inside a project.
- Edit any properties of existing tasks and projects.
- Delete any existing tasks and projects.
- Show the due date of a task.
    - You can show it however you wish: within the task, on the list view for the task, group by due dates, etc.


## Code Quality Requirements

You know how to store trivial information in Core Data. The purpose of this project is for you to develop a professional working application with Core Data. Think about your architectural choices and focus on code quality.

Your code will be examined on these categories:

- Code modularizaton: using classes for separation of concerns, following mvc
- Code comments: when needed to explain what the code does and explain decisions in the logic
- The use of simple abstractions: use of classes, structs and enums to help with code clarity and type safety
- Use of the Core Data Stack: create a custom core data stack (because usually you get one that's generic)
- Performance of code: correct use of the main thread

## Entities

- **Project**
    - Name
    - Color
    - Has many tasks
- **Task**
    - Belongs to a *single* Project
    - Title
    - Due Date
    - Status

## UI

The interface is up to you to decide. A sample design has been provided below, but you are free to experiment with your own interpretations.

![sketch](taskee.png)

## Stretch Challenges

These are **optional** for those looking for an extra challenge:

- Add a search bar in the home page to find tasks.
- Task reminder; send a local notification a day before a task is due.
- Utilze best practices from the [Swift style guide](https://google.github.io/swift)
- Create a widget companion for the app:

![widget](widget.png)


## External Links

Project idea based on: [The Task App](https://twitter.com/thetaskapp)
