# Day 3: Nested Routes and Resources

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity**              |
| ----------- | -------- | ------------------------- |
| 0:00        | 0:03     | Objectives                |
| 0:03        | 0:10     | Initial Exercise          |
| 0:18        | 0:15     | Overview                  |
| 0:33        | 0:15     | Activity I                |
| 0:48        | 0:05     | Activity II - Setup       |
| 0:53        | 0:10     | BREAK                     |
| 1:03        | 0:20     | Activity II - Code        |
| 1:23        | 0:20     | Activity II - Swap        |
| 1:48        | 0:10     | Activity II - Review      |
| 1:58        | 0:02     | Wrap Up
| TOTAL       | 2:00     |                           |

## Learning Objectives (3 Minutes)

1. Recall and review common REST paradigms in Express.
2. Experience common themes in API design, architecture, and implementation including maintainability and separation of concerns.
3. Identify best practices regarding the nesting of Express routes in order to produce developer-friendly endpoints.

## Initial Exercise (10 Minutes)

**Challenge**: read [this article](https://medium.com/@zachcaceres/child-routers-in-express-56f904597b1b) on modular routes in Express. In your notes, reflect on how the naming convention described in this article compares to APIs you've written or utilized.

## Overview (15 Minutes)

In the article we just read, **albums and tracks** are used as examples of how to **break down categorical information into smaller parts**.

Let's quickly recall one of our goals this term:

> I want to learn how to build **really solid APIs!**

Sensible route --- or endpoint --- design is one very important way we achieve well implemented, understandable APIs that developers are excited to leverage in their projects!

Ask for a show of hands: **who here has had to use a bad API before? What made it so bad?** After hearing a few answers, note that most stories boil down to this: _it was hard to use, because I couldn't understand how to use it!_

There's a common theme present in our shared strife, and a way to correct it. Today, we're looking at the stories your endpoints tell to other developers. Are they good, accurate stories? Or do they leave something to be desired upon utilization?

Let's practice that now!

## In Class Activity I: API Stories (15 Minutes)

**Challenge**: Ask students to come up with 3 additional category/item relationships that could be represented in a similar fashion.

After 5 minutes have passed, go around the room and ask students to share the ideas they've generated. Write them down on the whiteboard. Group the themes with students, and circle a few similar categories for use in the next activity.

## TT: Activity II Setup (5 Minutes)

The remainder of this class period will be all about using what we've just learned to tell a great story using nested routes in Express:

* Separate students into groups of 3 to 4.
* Assign each group a category from the whiteboard.
* Slack out the following requirements:
    ```markdown
    **Nested Routes: Mini-Project Requirements**:

    Create a VERY SIMPLE API in Node and Express that manipulates an array of in-memory objects.

    * HINT: Recall from BEW1.1 that the HTTP methods we use help tell a great story!
        * *GET* fetches an object or a list of objects.
        * *POST* adds a new object to the array.
        * *PUT* modifies an object in the array.
        * *DELETE* removes the object from the array.
    ```
* After a few minutes, ask if there are any questions and dismiss for break.

## BREAK (10 Minutes)

10 minute break to allow students time to brainstorm.

## In Class Activity II - Telling a Story (50 Minutes)

### Part I: Implementation (20 Minutes)

**Challenge**: Allow groups 20 minutes to create a GitHub repo, implement their endpoints, then commit and push. At the very minimum, create two `GET` endpoints --- one that retrives an object by ID, and one that retreives a list of objects.

### Part II: Swap and Integrate (20 Minutes)

**Challenge**: Ask groups to "swap" code with one another by sending one another the repository URL over Slack. Each group now has a new role --- as **integration engineers**! The goal? Fork the group's repo, then integrate a new nested endpoint, working with the code that the prior group provided! Once complete, commit and push your code.

### Part III: Peer Review (10 Minutes)

**Challenge**: Ask students to commit and slack the repositories they used to implement today's activities. It's time to play the role of **code reviewer**! Go to the original repo that you forked, and together as a group, leave a single GitHub Issue that reviews the code. What did the implementers do well? How was your experience working with their code? Seek out at least one thing that could improve/seemed confusing.

## Wrap Up (2 Minutes)

* Slack your group's filed GitHub issue to the `#bew1-2` Slack channel.
* Remind students to continue the Reddit tutorial as homework.

## After Class

* Continue work on the Reddit Tutorial.
