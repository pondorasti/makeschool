# BEW 1.3 Server-Side Architectures and Frameworks

## Course Description

In this course, students will learn to develop and release standardized server-side applications. Techniques include favoring convention over configuration, following a strict RESTful MVC architecture, and emphasising the role of automated testing.

This course begins by fostering familiarity with syntactic language features, then rapidly moves into building server-side web applications and APIs. Deliverables include at least two completed and deployed applications.

## Course Specifics

Weeks to Completion: 7 <br>
Total Seat Hours: 37.5 hours <br>
Total Out-of-Class Hours: 75 hours <br>
Total Hours: 112.5 hours <br>
Units: 3 units <br>
Delivery Method: Residential <br>
Class Sessions: 14 classes, 7 labs

## Prerequisites:

BEW 1.1, BEW 1.2

## Learning Objectives or Competencies (5-8)

Students by the end of the course will be able to ...

1. Gain familiarity with an opinionated web framework by developing in Ruby on Rails.
1. Master SQL-based Object Relationships Manager (ORM) patterns and queries.
1. Compare & Contrast Common Patterns for Backend Web Development
1. Design & Implement Multiple Rails applications.
1. Continue growth and Mastery of Automated Testing Paradigms.

## Tutorials & Projects

- [Ruby on Rails Guides Tutorial](https://guides.rubyonrails.org/getting_started.html)
- [RailsTutorial.org Twitter Clone](https://www.railstutorial.org/book)
- [Custom API Project](link-coming-soon)

## Evaluation

To pass this course you must meet the following requirements:

- Make up all classwork from all absences
- Finish all required tutorials and projects
- Pass the final exam (summative assessment) >=70%

## Lessons

1. [Rails and You: Catching the Ruby Train](01-Catching-The-Ruby-Train/README.md)
   - **Before Class**
     - Install Ruby via Homebrew: `brew install ruby`
1. [Convention Over Configuration: The Power of Rails](02-Convention-vs-Configuration/README.md)
   - **In Class Activities**
     - **Discuss**: Common Server-Side Conventions
       - Object-Oriented Programming Principles
       - Opinionated vs. Non-Opinionated Frameworks
       - RESTful Resources
   - **After Class**
     - HW: Hello, Ruby on Rails - Getting Started Guide Chapters 1 - 4.
1. [Your First Ruby on Rails Application](03-First-Application/README.md)
   - **In Class Activities**
     - **Students Do**: Build and Push a Simple Single Resource Application
   - **After Class**
        - HW - Tutorial: [From Zero to Deploy: RailsTutorial.org Chapter 1](https://www.railstutorial.org/book/beginning#cha-beginning)
1. [User Focused Development: Top Down Development](04-Top-Down-Development/README.md)
   - **In Class Activities**
     - **Watch Me / Discuss**: Error-Guided MVC Implementation
       - Views
       - Controllers
       - Models
     - **Students Do**: Rails Guide: Getting Started With Rails / Single Resource Application (MVC)
   - **After Class**
1. [Models: Multiple Resources, ORM, and Validation](05-Models/README.md)
   - **In Class Activities**
     - **Watch Me / Discuss**:
       - ActiveRecord querying, `has_many`, `belongs_to`
       - Demonstrate adding a second resource to the application.
     - **Students Do**:
       - Add another Resource to your Single Resource Application with `has_many`.
       - Add model validations.
   - **After Class**
1. [Views: Look and Feel](06-Views/README.md)
   - **In Class Activities**
     - **Watch Me / Discuss**:
       - Adding Assets
         - HAML
         - Asset Pipeline
         - Bootstrap with Gem
         - Bootstrap components, responsive helpers, forms
       - **Students Do:**
         - Bootstrap + Rails View: Smoke Test (Grid System, Typography)
   - **After Class**
1. [Writing Safer Code with Minitest](07-Testing/README.md)
   - **In Class Activities**
     - **Explore / Contrast + Compare**: Types of Tests
       - Unit/Model
       - Integration/Controller
       - Acceptance/View
     - **Students Do**: Focus - Integration/Controller Testing
       - Write controller tests for two resource application
   - **After Class**
1. [Advanced Routes](08-Advanced-Routes/README.md)
   - **In Class Activities**
     - **Discuss**:
       - Nested Routes
       - Named Routes
     - **Students Do**:
   - **After Class**
1. [Advanced Model Associations](09-Advanced-Model-Associations/README.md)
   - **In Class Activities**
     - **Discuss**:
       - `has_many :through`
       - Polymorphic Associations
     - **Students Do**:
       - Implement "Add Comments" User Story Using `has_many` Comments Pattern
   - **After Class**
1. [Authorization: Registering Your First User](10-Authorization/README.md)
   - **In Class Activities**
     - **Discuss**:
       - `has_secure_password`
       - `sign_up`
       - `session`
       - `current_user`
     - **Students Do**:
       - Implement "Sign Up" User Story
   - **After Class**
1. [Authentication: Login and Logout](11-Authentication/README.md)
   - **In Class Activities**
     - **Discuss**:
       - `login`, `authenticate`
       - Forgot Password pattern
     - **Students Do**:
       - Implement "Login", "Logout", and "Forgot Password" User Stories
   - **After Class**
1. [Deployment: Heroku](12-Deployment/README.md)
1. [Final Project](13-Final-Project/README.md)
1. [Final Project](13-Final-Project/README.md)

## Additional Resources

* [Why's (Poignant) Guide to Ruby](https://poignant.guide/book/chapter-1.html)

## Make School Course Policies

[Academic Honesty](https://github.com/Product-College-Courses/Common-Syllabus-Sections/blob/master/Academic-Honesty-and-Plagiarism.md)<br>
[Accomodation Policy](https://github.com/Product-College-Courses/Common-Syllabus-Sections/blob/master/Accommodation-Policy.md)<br>
[Diversity Statement](https://github.com/Product-College-Courses/Common-Syllabus-Sections/blob/master/Diversity-Statement.md)<br>
[Evaluation Methods](https://github.com/Product-College-Courses/Common-Syllabus-Sections/blob/master/Evaluation-Methods.md)<br>
[Title IX Disclaimer](https://github.com/Product-College-Courses/Common-Syllabus-Sections/blob/master/Evaluations-Title-X-Disclaimer.md)<br>
[Program Learning Outcomes](https://github.com/Product-College-Courses/Common-Syllabus-Sections/blob/master/Program-Learning-Outcomes.md)
