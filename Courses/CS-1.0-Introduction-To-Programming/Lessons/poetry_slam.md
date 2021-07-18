# Poetry Slam 📜

## Description
In this project, we will write a Python program to print out poetry backwards, randomly, and any way you can rearrange!

By reading a poem in news ways, we can discover new meanings or invite new interpretations.

###### Credit to Mark D. LeBlanc for their project posted on EngageCSEdu

## Learning Outcomes
By completing this project, you should be able to…

1. Implement functions
1. apply file input and output
1. Practice storing items in lists and reading from them
1. Implement loops
1. String manipulation and formatting
1. Apply the random module to your programs
1. Make connections to fields outside of CS

## Set Up:
🚨  Before starting the assignment, watch [How to: Setup for a New Assignment](https://youtu.be/MCbDO8IpqZM). 

This tutorial walks your through how to set up a new repository, make commits, and push code to Github.


## Requirements

### Submission Requirements:
1. Your submitted code should be in a new (public) repo on Github.
1. Your respository should have a minimum of **5 commits**. 
1. Your repo should include a README with the name of your project and a description.
1. Create a demo video. The demo should include a walkthrough of your code and demonstration of how your bot working.
1. [Optional] Upload your video to Google Drive and share a link if Gradescope upload speeds are too slow.
1. Submit the link to your repo and demo on Gradescope.


### Assignment Requirements:

1. You will store your poem in a `.txt` file. Feel free to use any poem of your choice!

1. Create a function called `get_file_lines()`:
    * It should have 1 parameter called `filename`, which is a string of the filename.
    * It should `return` a list of strings containing the lines of the file.


1. Create a function called `lines_printed_backwards()`:
    * It should have 1 parameter called `lines_list`, which is a list of strings containing lines of your poem. 
    * It should `print` the lines of the poem in reverse. Include the original line number at the beginning of each line.

      For example, if you poem is Remember by Joy Harjo:

      **In `poem.txt`:**
      ```
      Remember the sky that you were born under,
      know each of the star's stories.
      Remember the moon, know who she is.
      Remember the sun's birth at dawn, that is the
      strongest point of time. Remember sundown
      and the giving away to night.
      Remember your birth, how your mother struggled
      to give you form and breath. You are evidence of
      her life, and her mother's, and hers.
      Remember your father. He is your life, also.
      Remember the earth whose skin you are:
      red earth, black earth, yellow earth, white earth
      brown earth, we are earth.
      Remember the plants, trees, animal life who all have their
      tribes, their families, their histories, too. Talk to them,
      listen to them. They are alive poems.
      Remember the wind. Remember her voice. She knows the
      origin of this universe.
      Remember you are all people and all people
      are you.
      Remember you are this universe and this
      universe is you.
      Remember all is in motion, is growing, is you.
      Remember language comes from this.
      Remember the dance language is, that life is.
      Remember.
      ```

      **then your `lines_printed_backwards()` function will print:**

      ```
      26 Remember.
      25 Remember the dance language is, that life is.
      24 Remember language comes from this.
      23 Remember all is in motion, is growing, is you.
      22 universe is you.
      21 Remember you are this universe and this
      20 are you.
      19 Remember you are all people and all people
      18 origin of this universe.
      17 Remember the wind. Remember her voice. She knows the
      16 listen to them. They are alive poems.
      15 tribes, their families, their histories, too. Talk to them,
      14 Remember the plants, trees, animal life who all have their
      13 brown earth, we are earth.
      12 red earth, black earth, yellow earth, white earth
      11 Remember the earth whose skin you are:
      10 Remember your father. He is your life, also.
      9 her life, and her mother's, and hers.
      8 to give you form and breath. You are evidence of
      7 Remember your birth, how your mother struggled
      6 and the giving away to night.
      5 strongest point of time. Remember sundown
      4 Remember the sun's birth at dawn, that is the
      3 Remember the moon, know who she is.
      2 know each of the star's stories.
      1 Remember the sky that you were born under,
      ```

1. Create a function called `lines_printed_random()`:
    * It should have 1 parameter called `lines_list`, which is a list of strings containing lines of your poem. 
    * It should `print` the lines of your poem in randomly order. **Repeats** are ok, but make sure the number of lines printed is equal to the original lines in the poem (Line numbers do not need to be printed.) Hint: try using a loop and `randint()` from the `random` module. 

1. Create a function called `lines_printed_custom()`:
    * It should minimally have 1 parameter called `lines_list`, which is a list of strings containing lines of your poem. 
    * It should print the poem in a unique way, be creative!
    * Make sure that you carefully comment your custom function so it's clear what it does.

1. Your final submitted code should use the four functions (`get_file_lines()`, `lines_printed_backwards()`, `lines_printed_random()`, and  `lines_printed_custom()`) you wrote. It should print out the poem contained in your text file backwards, random, and custom to the terminal.

1. The class session after this assignment is due we will have an optional poetry reading in class!

### Stretch Requirements/Challenges (Optional)
1. Modify your program to write your poems to a file.
1. Modify your program to have a menu that the user can select from rather than printing all the options at once
1. Modify your program to read the poem from user input
1. Modify your program to randomly rearrange the words on each line


## Rubric
This project will be graded using the [Poetry Slam Rubric](https://docs.google.com/document/d/1pXQeuD7R4ZRCjPQLvnVSdyCiAwOz5qDPXTxAgNS_2rM/copy)


## Resources
Additional resources that will help with this project, or that can be used as reference

- [Poems by Joy Harjo](https://poets.org/poem/remember-0), the first native american poet laureate in the U.S.
- [DetoNationxs by Ocean Vuong](https://www.poetryfoundation.org/poetrymagazine/poems/56768/detonation)
- [Harlem Renaissance Poems](https://education.cu-portland.edu/blog/classroom-resources/harlem-renaissance-poets-for-your-reading-list/)
