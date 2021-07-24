<p align="center">
  <img src="node.png" height="110">
</p>

# BEW 1.3 - Server-Side Architectures & Frameworks

<!-- omit in toc -->
## Table of Contents

1. [Course Description](#course-description)
1. [Prerequisites](#prerequisites)
1. [Learning Outcomes](#learning-outcomes)
1. [Study Guide](#study-guide)
1. [Class Schedule](#class-schedule)
1. [Class Recordings](#class-recordings)
1. [Class Assignments](#class-assignments)
1. [Evaluation](#evaluation)
1. [Late Assignment Policy](#late-assignment-policy)
1. [Additional Resources](#additional-resources)
   1. [Information Resources](#information-resources)
   1. [Interview Topics](#interview-topics)
1. [Make School Course Policies](#make-school-course-policies)

## Course Description

In this course, students build on knowledge of RESTful web patterns and dive deep into the Node and Express ecosystems. Students learn how to manage greater scope and complexity in their code while consistently keeping the user's experience in mind through implementing a clone of the popular website, Reddit. The course will also cover the procedures required to authenticate and authorize web application users.

## Prerequisites

1. [WEB 1.1](http://make.sc/web1.1)

## Learning Outcomes

Students by the end of the course will be able to&hellip;

1. Diagram and implement resource associations using a document-based database.
1. Write advanced db queries with a focus on optimum performance and efficiency.
1. Discern between differing levels of persistence and the use cases that best fit each.
1. Implement authentication using JWT tokens and sessions.
1. Invent, create, test, deploy, and deliver a custom, fully secured API.

## Study Guide

<!-- To best prepare for the final exam, review [this study guide](study-guide.md). -->

## Class Schedule

**Course Dates:** Monday, May 31 – Friday, July 16, 2021 (7 weeks)

**Class Times:** Monday, Wednesday, Friday at 9:30am–11:15am (19 class sessions)

| Class |          Date          |                 Topics                  |
|:-----:|:----------------------:|:---------------------------------------:|
|  - |  Mon, May 31         | **No Class - Memorial Day** |
|  1 |  Wed, June 2         | Getting Started with Node & ES6 |
|  2 |  Fri, June 4         | Giphy Search Lab |
|  3 |  Mon, June 7         | Node School JavaScripting |
|  4 |  Wed, June 9         | Eloquent JavaScript Reading |
|  5 |  Fri, June 11        | Working with Promises |
|  6 |  Mon, June 14        | Airbnb JS Styleguide |
|  7 |  Wed, June 16        | How JavaScript Got BIG |
|  8 |  Fri, June 18        | Complex Associations |
|  9 |  Mon, June 21        | Auth with JWT |
| 10 |  Wed, June 23        | Flex/Lab Day |
| 11 |  Fri, June 25        | Passport Auth |
| 12 |  Mon, June 28        | Testing w/ Mocha & Chai |
| 13 |  Wed, June 30        | Testing Express Routes |
| 14 |  Fri, July 2         | Intro to Web Security for Node.js |
| -  |  Mon, July 5         | **No Class - Independence Day Observed** |
| 15 |  Wed, July 7         | Node.js Capstone Kickoff Day |
| 16 |  Fri, July 9         | Error Handling |
| 17 |  Mon, July 12        | Topical Blog Post Writing Day |
| 18 |  Wed, July 14        | Lab/Flex Day |
| 19 |  Fri, July 16        | Project Fair |

For more see: [make.sc/bew-1-3](https://make.sc/bew-1-3)

<!-- 
| Class |     Date      | Topics | Assignment Due | Assessment |
| :---: | :-----------: | :--------: | :--------: | :--------: |
|  1 |  Mon, Mar 29 / Tue, Mar 30 | [Intro to Node](Lessons/01-Intro-to-Node/) | - | |
|  - |  Wed, Mar 31 / Thu, Apr 1  | **No Class - Cesar Chavez** |
|  2 |  Mon, Apr 5  / Tue, Apr 6  | [JS Intro & Asynchronous Programming](Lessons/02-Intro-to-JS/) | [GIF Search Tutorial] | |
|  3 |  Wed, Apr 7  / Thu, Apr 8  | [HTTP Methods & Endpoint Design](Lessons/03-Http-Methods/) | [Codecademy JS]: Promises & Async/Await<br>[Promise Challenges] | |
|  4 |  Mon, Apr 12 / Tue, Apr 13 | [Databases](Lessons/04-Databases/) | [Reddit.js] Part 1-3 | |
|  5 |  Wed, Apr 14 / Thu, Apr 15 | [Testing with Mocha & Chai](Lessons/05-Testing-Mocha-Chai/) | [Reddit.js] Part 4-6 | |
|  6 |  Mon, Apr 19 / Tue, Apr 20 | [Documentation with Docsify](Lessons/08-Documentation/) | [TDD/BDD Challenges] |  [Midterm Assessment](Assessments/midterm-assessment.md)|
|  7 |  Wed, Apr 21 / Thu, Apr 22 | [Testing Express Routes](Lessons/06-Testing-Express-Routes/) | [API Project Proposal/Documentation] | |
|  8 |  Mon, Apr 26 / Tue, Apr 27 | [Review/Lab Day](Lessons/09-Review/) | [Chai Testing Challenges] |  |
|  9 |  Wed, Apr 28 / Thu, Apr 29 | [Authentication with JWT](Lessons/07-Authentication/) | [Reddit.js] Part 7-9 | |
| 10 |  Mon, May 3  / Tue, May 4  | [More Authentication](Lessons/11-More-Authentication/) | [API Project] Phase 2 | |
| 11 |  Wed, May 5  / Thu, May 6  | Lab Day | [Reddit.js] Part 10-11<br>[Auth API Tutorial](https://scotch.io/tutorials/authenticate-a-node-es6-api-with-json-web-tokens) | |
| 12 |  Mon, May 10 / Tue, May 11 | [Authentication with Passport](Lessons/10-Passport/) / [Deployment](Lessons/12-Deployment/README.md) |  | |
| 13 |  Wed, May 12 / Thu, May 13 | Final Class | [API Project] Phase 3 | [Final Assessment](Assessments/final-assessment.md) |

[GIF Search Tutorial]: https://www.makeschool.com/academy/track/gif-search-app-ynu
[Codecademy JS]: https://www.codecademy.com/learn/introduction-to-javascript
[Promise Challenges]: https://github.com/Make-School-Labs/promises-challenges
[Reddit.js]: https://www.makeschool.com/academy/track/reddit-clone-in-node-js
[TDD/BDD Challenges]: https://github.com/make-school-labs/tdd-bdd-challenge
[Chai Testing Challenges]: https://github.com/make-school-labs/chai-testing-challenges
[JWT/Authentication Challenges]: #
[Advanced Testing Challenges]: #
[Advanced Authentication Challenges]: #
[API Project Proposal/Documentation]: https://make-school-courses.github.io/BEW-1.3-Server-Side-Architectures-and-Frameworks/#/Lessons/08-Documentation/?id=wrap-up
[API Project]: Projects/02-Custom-API-Project.md
[Midterm Assessment]: Assessments/quiz-1.md
[Final Assessment]: Assessments/quiz-2.md -->

## Class Recordings

All class recordings for Jay's class will be available [here](https://drive.google.com/drive/folders/1bm86K24dYJPeS1LyOrGMySwojubl9BNx?usp=sharing) no later than 24 hours after the class session. For privacy reasons, please do not share the recordings outside of the Make School student body.

## Class Assignments

We will be using Gradescope this term, which allows us to provide fast and accurate feedback on your work. All assigned work will be submitted through Gradescope, and assignment and exam grades will be returned through Gradescope. As soon as grades are posted, you will be notified immediately so that you can log in and see your feedback. You may also submit regrade requests if you feel we have made a mistake.

Your Gradescope login is your Make School email, and your password can be changed at https://gradescope.com/reset_password. The same link can be used if you need to set your password for the first time.

1. [Make Parties (Tutorial)](https://www.makeschool.com/academy/track/make-tweets)
1. [Reddit.js (Tutorial)](https://www.makeschool.com/academy/track/reddit-clone-in-node-js)
1. [Passport Authentication Challenge](https://docs.google.com/spreadsheets/d/1cItyOCe6tNv4EURFjmlOb6DdUvhV2WI7zCdoBhUyDHA/edit#gid=876739297)
1. [TDD/BDD Challenges](https://github.com/make-school-labs/tdd-bdd-challenge)
1. [API Project](https://docs.google.com/a/makeschool.com/document/d/1HVG0vkrENPRUTzHSuaI41A0sp_MUIlwYG07Q77KImCA/edit?usp=sharing)


## Evaluation

**To pass this course, you must earn at least a 70% weighted average, according to the following breakdown**:

- **API Project**: 30%
- **Tutorials, Assignments, Projects, & Class Participation**: 50%
  - All tutorials graded on completion
- **Midterm and Final Assessment**: 20%

In order to pass this course, you must also:

- Actively participate in class and abide by the attendance policy
- Make up all classwork from all absences

## Late Assignment Policy

- Late assignments that are submitted **more than 5 days (120 hours)** after the deadline will be given a **25% late penalty**.
- The **absolute last day** to submit any assignment will be **Monday, March 3 at 11:59 PM**.

If you require accommodations or have extenuating circumstances such as prolonged illness, please contact your instructor to request an extension.

## Additional Resources

### Information Resources

Any additional resources you may need (online books, etc.) can be found here. You can also find additional resources through the library linked below:

- [Eloquent JavaScript (Textbook)](https://eloquentjavascript.net/)
- [jwt.io](https://jwt.io): JSON Web Tokens are an open, industry standard RFC 7519 method for representing claims securely between two parties. JWT.IO allows you to **decode, verify and generate JWT**.
- [make.sc/library](http://make.sc/library)

### Interview Topics

#### Algorithmic/Computer Science

**Topics**:

- authentication
- unit testing
- async practices


#### Technical Discussion

**Topics**:

- **Selecting a Stack**: How do I choose the right stack? When should I use Node?
- **Configuration vs. Convention**: Determining your personal preferences regarding frameworks.

## Make School Course Policies

- [Program Learning Outcomes](https://make.sc/program-learning-outcomes) - What you will achieve after finishing Make School, all courses are designed around these outcomes.
- [Grading System](https://make.sc/grading-system) - How grading is done at Make School
- [Code of Conduct, Equity, and Inclusion](https://make.sc/code-of-conduct) - Learn about Diversity and Inclusion at Make School
- [Academic Honesty](https://make.sc/academic-honesty-policy) - Our policies around plagiarism, cheating, and other forms of academic misconduct
- [Attendance Policy](https://make.sc/attendance-policy) - What we expect from you in terms of attendance for all classes at Make School
- [Course Credit Policy](https://make.sc/course-credit-policy) - Our policy for how you obtain credit for your courses
- [Disability Services (Academic Accommodations)](https://make.sc/disability-services) - Services and accommodations we provide for students
- [Online Learning Tutorial](https://make.sc/online-learning-tutorial) - How to succeed in online learning at Make School
- [Student Handbook](https://make.sc/student-handbook) - Guidelines, policies, and resources for all Make School students
