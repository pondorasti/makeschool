# Demo Game

This is demo app to give an idea of the kinds of code and programming involved with programming web applications.

View the game live [here](https://make-school-labs.github.io/few-track-demo/).

# Instructions

- Download this project and open the folder in VSCode. This is where you will be editing the code.
- Now open the file `index.html` in your web browser. This is where you will see all the changes once they take effect.

1. Let's start in the `index.html` file using your code editor
   1. Find the `title` tag, and change it from `demo game` to something fun
   2. Find the `h1` tag that holds our `boring game title`, and update it with a new fun and exciting name
   3. Find the `link` to our stylesheet and add in the `href` attribute
   4. Take a look at whats changed on the page (refresh the webpage in your browser)
2. Now over to the `style.css` file
   1. Look through the images folder and find a cool alien you want to play as
   2. In the `:root` rule, change the `--player-image` variable to the your favorite alien
   3. Lets also change the `--background-image` to your favorite wall
   4. Now lets change the `--button-color` to something more readable
   5. The buttons look better, but them being square is a little weird, so lets find the `.button` rule
   6. inside the `.button` rule, lets add a new property `border-radius` and set it to a value of `50%`
   7. Take a look at whats changed on the page (refresh the webpage in your browser)
3. Now the page looks a lot better, lets make it work
   1. Go back to the `index.html` file and find the `script` tag, add in the `src` attribute
   2. Take a look at whats going on, things are moving now!
   3. Find the `timePerBomb` and `timePerFruit` variable and change them until you find a balance you like.
   4. Find the `makeObject` function, and inside find where the objects speeds are set.
   5. Change the speed of the bombs and fruits until you find a balance you like
   6. Take a look at whats changed on the page (refresh the webpage in your browser)
4. Looks good!

🎉 Congrats! you've turned the starter project into a functional game with your own game mechanics. You made it possible using HTML, CSS and JS. Feel free to glance over the project files and see if there are things you understand and things you are not sure about just yet.

## Todo -

1. Some tasks to explore programming on the web.
  - Include comments with notes on possible values along side code
  - Building Web Applications
    - Need a branch to demo the completed game
    - Master branch should leave out some things that become and activity
      - Links to css files and js files
        - These files might be broken into separate files
  - HTML
    - Add some images of other characters
    - Add CSS styles
    - Add JS file
  - CSS
    - Can be better organized for demo
    - Add opportunities for students to make improvements to the appearance
      - #container overflow hidden
      - #contanier round corner
      - .button round corner changes colors
      - .button:hover change colors
      - add a box shadow to player
    - Change game images used as game elements
      - --player-image
      - --bg-image
      - --bomb-image
      - --fruit-*
  - JS
    - Add link to main.js
    - Change somethings in the JS to see what happens
      - Edit variables
        - change the speed and frequency of elements
          - speed of bombs and fruit
          - frequency of fruit vs bombs
