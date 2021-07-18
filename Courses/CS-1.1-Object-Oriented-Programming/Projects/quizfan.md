# Are You a Fan Quiz?

## Description
In this project we will write a Python program to create a quiz on a topic of your choosing!

Credit to Gina Sprint for [this project](https://www.engage-csedu.org/find-resources/are-you-fan-quiz) posted on EngageCSEdu

## Learning Outcomes
By completing this project, you should be able to…

1. Implement functions and call functions
1. Implement lists
1. Implement loops
1. Implement conditionals
1. String manipulation and formatting
1. Make connections to fields outside of CS
1. Get input from the user and display output

## Requirements

[Click here](https://github.com/Make-School-Courses/CS-1.1-Intro-to-Programming/blob/master/Projects/QuizExamples.txt) for some example program runs

Your quiz must contain at least 5 questions. These 5 questions include at least 2 of each of the following
different types of questions:

### Multiple choice (5 options a-e)
The user enters in a character "a" through "e" for their answer.

Example:

1) What is the a rough estimate of the population of New York City? Please enter
a character a-e.

a) 1 million

b) 3 million

c) 5 million

d) 8 million

e) 10 million

Note: The answer is d) 8 million!

### Numeric Response
The user enters in a numeric response to an open ended question. I recommend prompting the user to enter
an integer. If you choose to use floats, be specific to the user about how they should enter their response (i.e.
rounded and/or a certain number of decimal places).

Example:

How many states are there in the United States? Please enter an integer.

Note: The answer is 50!

### True/False (Boolean)
The user enters 1 or 0 in response to a true or false statement. Compare the response to the correct answer and return a 1 if they got it right and a 0 if not. 

Example:

Alaska was the last state to enter the Union, true or false? Please enter 1 for
True or 0 for False.

Note: The answer is False! Hawaii was the last state to enter the Union.

### Additional requirements:
1. For each question:

    1. Define a function. The function should return the following:

    1. 1 (int) if the user answered correctly

    1. 0 (int) if the user answered incorrectly

    1. Explicitly tell the user the format in which they should enter their response.

    1. Number each question.

Check the user's answer for correctness using an if­else structure. If the user answers
correctly, inform the user. Otherwise, provide the correct answer to the user.

2. Keep track of the  the number of correct answers (this is the user's quiz score).

3. Keep track of the correct and incorrect answers in a list.

4. At the end of the quiz, tell the user their final score, which questions were correct or incorrect, plus a fun statement about how much of a "fan"
they are of the quiz's topic (use an if­elif­else structure, which means you need at least 3
different fun statements based on the user's score).

### Stretch Requirements/Challenges (Optional)
1. Modify your program to be able to handle incorrect input from the user, such as a character besides a-e being entered in a multiple choice question
1. Modify your program to include a menu that lets the user take the quiz multiple times 
1. Modify your program to inlcude a menu that lets the user choose from a set of multiple quizzes to take

## Rubric
This project will be graded using [the CS1.1 Are you a fan quiz rubric]()

## Commit Requirements

**All projects will require a minimum of 5 commits, and must take place throughout the entirety of the course**

- **Good Example:** 40+ commits throughout the length of the project, looking for a healthy spattering of commits each week (such as 3-5 per day).
- **Bad Example:** 10 commits on one day during the course and no others. Students who do this will be at severe risk of not passing the class.
- **Unacceptable Example:** 2 commits the day before a project is due. Students who do this should not expect to pass the class. 

### Why are we doing this?
We want to encourage best practices that you will see working as a professional software engineer. Breaking up a project by doing a large amount of commits helps engineers in the following ways:

- It's much easier to retrace your steps if you break your project/product/code up into smaller pieces
- It helps with being able to comprehend the larger problem, and also will help with your debugging (i.e. finding exactly when you pushed that piece of broken code)
- It allows for a more streamlined, iterative communication in your team, as it's much easier to hand off a small change to someone (updating a function) than a huge one (changed the architecture of the project)

Through this requirement, we hope to encourage you to think about projects with an iterative, modular mindset. Doing so will allow you to break projects down into smaller milestones that come together to make your fully-realized solution.

## Resources
Additional resources that will help with this project, or that can be used as reference

- [Game of thrones quiz](https://www.allthetests.com/quiz32/quiz/1424600000/Game-Of-Thrones-Quiz)
