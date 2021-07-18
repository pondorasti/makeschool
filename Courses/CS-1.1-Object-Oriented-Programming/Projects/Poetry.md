# Backwards Poetry

## Description
In this project we will write a Python program to print out poetry backwards, randomly, and any way you can rearrange!
By reading a poem in news ways we can discover new meanings or invite new interpretations.

Credit to Mark D. LeBlanc for their project posted on EngageCSEdu

## Learning Outcomes
By completing this project, you should be able to…

1. Implement functions
1. Practice storing items in lists and reading from them
1. Implement loops
1. String manipulation and formatting
1. Apply the random module to your programs
1. Make connections to fields outside of CS

## Schedule

From the day this project is assigned, you will have approximately **1 week** to complete this project. A sample daily outline is provided to assist you in planning your project.

**Important note:** “Day 01” refers to the first calendar day of the project being assigned, and subsequent days will follow this reference:

- Day 01: Project assigned, read the project spec, ask any clarifying questions you may have, begin designing how you would implement the project, set up your repo
- Day 03: Build lines_printed_backwards() function
- Day 05: Build lines_printed_random() function
- Day 06: Build a rearrange function of your choice
- Day 07: Fix any remaining bugs, make sure your code has helpful comments, and submit the project!

## Requirements

1. You can store your poem as a multi line string in Python, you do not need to read from a file.

2. Your code should implement the lines_printed_backwards() function. This function takes in a list of strings containing
the lines of your poem as arguments and will print the poem lines out in reverse with the line numbers reversed. For example, if you poem is Invitation by Shel Silverstein:

If you are a dreamer, come in,\
If you are a dreamer, a wisher, a liar,\
A hope-er, a pray-er, a magic bean buyer…\
If you’re a pretender, come sit by my fire\
For we have some flax-golden tales to spin.\
Come in!\
Come in!

then your function will print:

7 Come in!\
6 Come in!\
5 For we have some flax-golden tales to spin.\
4 If you’re a pretender, come sit by my fire\
3 A hope-er, a pray-er, a magic bean buyer…\
2 If you are a dreamer, a wisher, a liar,\
1 If you are a dreamer, come in,

3. Your code should implement the lines_printed_random() function which will randomly select lines from a list of strings and
print them out in random order. Repeats are okay and the number of lines printed should be equal to the original number of lines
in the poem (line numbers don't need to be printed). Hint: try using a loop and randint()

4. Your code should implement a function of your choice that rearranges the poem in a unique way, be creative! Make sure that you carefully comment your custom function so it's clear what it does.

5. Feel free to use any poem of your choice.

### Stretch Requirements/Challenges (Optional)
1. Modify your program to read the poem from a file
1. Modify your program to read the poem from user input
1. Modify your program to randomly rearrange the words on each line

## Rubric
This project will be graded using [the CS1.1 Backwards Poetry Rubric](https://www.makeschool.com/rubrics/UnVicmljLTg4)

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

- [Shel Silverstein Poems](http://thewhynot100.blogspot.com/2014/05/46-short-and-sweet-shel-silverstein.html)
- [Harlem Renaissance Poems](https://education.cu-portland.edu/blog/classroom-resources/harlem-renaissance-poets-for-your-reading-list/)
