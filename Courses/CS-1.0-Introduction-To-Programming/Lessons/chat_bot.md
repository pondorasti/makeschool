# Chat Bot 💬

## Description
In this project, we will write a Python program to create simple [chat bot](https://www.cleverbot.com/) using conditionals, lists, and loops. Your chat bot will be focused on a specific topic so think about what kinds of questions you want your chat bot to answer!

Feel free to use any chat bot topic of your choice, it could be a mood bot or a bot that wants to talk about video games, be creative! The class session after this assignment is due we will have a show and tell session where we can all try each other's chat bots out!

Unsure where to get started? Check out this [example Chat Bot](https://repl.it/@MakeSchool/firstchatbot?lite=true#main.py) we created during class.

## Learning Outcomes
By completing this project, you should be able to…

1. Implement more advanced functions
1. Use conditionals and boolean logic to control prompts and responses
1. Use lists to store and manipulate responses
1. Use loops to check for input
1. Use an imported function from a built-in module

## Set Up:
🚨  Before starting the assignment, watch [How to: Setup for a New Assignment](https://youtu.be/MCbDO8IpqZM). 

This tutorial walks your through how to set up a new repository, make commits, and push code to Github.


## Requirements

### Submission Requirements:
1. Your submitted code should be in a new (public) repo on Github.
1. Your respository should have a minimum of **5 commits**. 
1. Your repositroy should include a README with the name of your Chat Bot and a description.
1. Submit the link to your repo on Gradescope.
1. Create a demo video. The demo should include a walkthrough of your code and demonstration of how your bot working.

### Assignment Requirements:

1. Create a function called `get_bot_response()`. This function must: <br/>
   * It should have 1 parameter called `user_response`, which is a **string** with the users input. <br /><br />
   * It should `return` a **string** with the chat bot's response. <br /><br />
   * It should use **at least 2** lists to store **at least 3** unique responses to different user inputs. For example, if you were building a mood bot and the user entered "happy" for how they were feeling your happy response list could store something like "I'm glad to hear that!", "Yay!", "That is awesome!". <br/><br />
   *  Use conditionals to decide which of the response lists to select from. For example: if a user entered "sad", my program would choose a  reponse from the of sad response list. If a user entered "happy", my program would choose a reponse from the of happy response list. <br /><br />
   *  Use `choice()` to randomly select one of the three responses. (See example from class.) <br /><br />

1. Greet the user using `print()` statements and explain what the chat bot topic is and what kind of responses it expects.

1. Get user input using the `input()` function and pass that user input to the `get_bot_response()` function you will write

1. Print out the chat bot's response that is returned from the `get_bot_response()` function

1. Use a `while()` loop to keep running your chat bot until the user enters `"done"`.


### Stretch Requirements/Challenges (Optional)
1. Modify your program to interpret even more complex responses and answers

## Rubric
This project will be graded using the [Chat Bot Rubric](https://docs.google.com/document/d/1RFZo2KHTOTVk-uL0LL93MUgSey-wPQjTvSRsxPyTivw/copy)
