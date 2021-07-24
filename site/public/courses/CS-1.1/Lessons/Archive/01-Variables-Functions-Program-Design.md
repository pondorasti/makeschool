## Initial Exercise (10 min)

- Group introduction exercise.  Choose a programming concept from the white board (or add if it's not there), write it on a sticky note, and use it to introduce yourself. Get creative.

# Variables and Functions

## [Slides](https://docs.google.com/presentation/d/15FXIiY8TU8DQ76L3xsRlYixiUX3qcdcfoQjwUd4Ud2c/edit?usp=sharing)

## Learning Objectives/Competencies

1. Practice writing outlines for high level program design
1. Review functions and variables
1. Understand how scoping works with variables
1. Compare global and local variables, what it means for a variable to be scoped to a function

## Course Overview (10 min)

### Course Learning Outcomes
Posted on syllabus

### Policies
- Participation
- Turning in assignments
- Notification if late / not attending

### How to Succeed in this Course
Make School courses are primarily hands on.  Your instructor will introduce a topic, help set context, build motivation and curiosity; but it's up to you to study concepts and practice coding until you master a topic.

- If a tutorial mentions "Learn more about lists" - you should read the documentation on lists, build sample programs to practice learning lists, quiz yourself on list concepts and overall become a master of lists.
- If a concept explained in class is not clear, you should dig into it after class.  Look for online explanations, ask your peers, build sample programs, ask your TA, slack your instructor.  Come to the next class an expert in this concept.

## Review of Variables and Functions (15 min)

### Functions
We can use functions to encapsulate parts of our program and make it accessible to re-use from other parts of our program and make it easier for a human reader to understand.

- Functions are defined once and can be called multiple times.

### Variables
The most basic program uses variables to store input.

- Each variable has a dynamic data type based on the value assigned to it (string, int, float).
- All data types are Objects in Python, but some are immutable.
- Variable names should be meaningful to the context of the data they store.
- We can process input information by performing operations on the variables.
- Basic operations include mathematical and string manipulation.
- You can explicitly tell a variable what type it should be by casting it

### Scoping
Since everything is an object in Python, when you pass an argument to a function parameter it uses the "pass by object" protocol instead of "pass by reference"
This means the reference to the object is what is passed, but immutable objects remain immutable while other objects can be modified in the body of the function.
This will help us in defining the scope of a variable. Think of the scope as when a given name can refer to a given variable

## Scoping Activity (10 min)
Work on your own and then with a neighbor to figure out what the function will print (see problem in slides)

## Break (10 min)

## Program Design Overview + Activity (20 min)

### Overview (10 min)
- Every program can be broken down into input, output and processing.  In order to perform the processing, you need fundamental programming concepts.
- This process is useful at the design stage because it helps to scope the project and identify requirements.
- Translating all these processing steps directly into the details of a program really only works in small programs though: in most programs, implementation works best using an agile approach which starts from a minimum viable product (MVP) and then iteratively builds features (see SPD for more on how to do this!)
- This allows features to change with changing requirements.

### Activity (10 min)
As a class, choose a program example (ie Facebook), and we’ll break it down into input, output, and processing on a whiteboard.

Label the core concepts, and discuss how these concepts build into a program



## Mad Libs Program Design Activity (45 min)

### Overview (5 min)

Mad Libs typically starts by prompting you (the user) to provide words based on the various parts of speech:, typically adjectives, nouns, and verbs. 

Once you have provided those words, they get placed into a short story with blanks for the specific parts of speech (i.e. if you’re prompted for two adjectives and one verb, the story will have two blanks for adjectives and one blank for a verb).

### Activity (40 min)

Find a partner, and read through the [Mad Libs Spec](https://docs.google.com/document/d/1suR3hzqfGSL9o99rNbDrcU0N1Z47EREubP38IY4Ptuc/edit?usp=sharing) together. From there, create a program design for Mad Libs. 

With your partner, establish the following:

- Input, output, and processing.
- Expand processing section details to more clearly define what work is being done
- Label programming concepts

## After Class

- Start working on Mad Libs project
- First 2 chapters of Rainbow Checklist tutorial
