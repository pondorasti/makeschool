# FEW 1.2 Class - 8 

## Phaser

Phaser is a library for making games in JS. Phaser is pretty sophisticated it takes all of the objects you might have created in the Breakout game and abstracts them into a set of classes you might use to make many different games. It also adds a set of classes and utilities that abstract all services you might for creating games. These are things like Physics and Audio. 

Phaser renders everything to a canvas or with JS. Phaser supports many advanced game concepts like physics, spritesheets, tweens, particle systems, and more. 

Phaser is free and available on [GitHub](https://github.com/photonstorm/phaser), you can contribute! version 1 was released in 2013. Currently, Phaser is up to version 3.

We will be covering Phaser 3 in this class. 

### Goals 

The goal of this class is learning to work with a complex library. While we will be spending a lot of time working with Phaser, where this becomes a real-world skill for you is considering that learning Phaser and figuring out its functions, objects, and classes are the same process you will use with many other libraries in the future. 

## Objectives 

- Using JavaScript Libraries
- Using documentation
- Use build systems
	- ES6 Modules
- Use Modules to manage dependencies

## Why Learn Phaser JS?

Currently, there are more libraries and frameworks written for JS than any other language. Learning to use and implement a library is an important skill. 

The Phaser 3 library is very complex. Implementing a project in Phaser isn't about learning Phaser. Instead, it's about learning how to read the documentation, apply methods and classes from a library _that you didn't write_. This is an important skill every developer has to learn. 

Also, learning Phaser gives you a chance to see the same problems you solved earlier with vanilla JS and how they would be solved with a high degree of abstraction. If you kept evolving your previous games you would end up with a library like Phaser, after some years of development! Seriously. 

## Getting started

You will follow the video tutorial series here: 

https://www.youtube.com/watch?v=GUZ8SsLQKUs&list=PLoN_ejT35AEhY4icjiEJ5t2qdunwmQj1R

This series of videos walks through all of the steps in the tutorial and then goes further by discussing modifcations and other features you might add.

The video tutorial diverges from the tutorial by using the webpack starter project and ES6 modules.

Follow the videos, takes notes on any questions you have along the way. Don't hesitate to contact me if you have questions.

## Notes

The video tutorial covers everything below you can follow the videos and refer to this section for reference. 

### Local Server and CORS

Phaser loads assets through the file system. For this reason, you will need to run Phaser projects from a server. 

**You can not run Phaser projects directly from your desktop.**

Why? The browser prevents accessing files directly from the desktop. This is a security issue. The concept is Cross-Origin Resource Sharing or CORS. 

The common solution is to create a local file server to serve your Phaser Project while testing locally. 

Read more about this [here](https://phaser.io/tutorials/getting-started-phaser3). 

### Phaser 3

Phaser is a game library written in JS. **The latest version is 3**. There is a lot of documentation written for *version 2*. For this assignment, you must use version 3! When you check the notes, tutorials, and documentation part of your job will be to verify that the information you are researching applies to version 3. 

If not you'll need to convert the information, code snippets, 
examples, tutorials, etc. to Phaser version 3. 

## Webpack

[Webpack](https://webpack.js.org) is a Module Bundler. Its main purpose is to bundle JavaScript files for use in the browser. Webpack can also run tasks. You can use Webpack to process files, bundle them, then start a local web server and serve your project. 

Phaser 3 has a Webpack starter you can use to for building your projects. 
Follow these steps: 

1. Download the start project [here](https://github.com/soggybag/phaser3-project-template)
1. Open terminal and `cd` to the directory with the starter template. 
1. Run `npm install` in the terminal

From here you can start a local server and edit your project and see live updates in your browser by running: `npm start`

Files that are part of your "build" will go in the `src` directory. Webpack looks here and creates the bundle from files in src.

Images, sounds, and other file resources should be stored in the assets directory. 

### Modules 

With the project setup using Webpack, we have access to module and bundling system. 

This system defines each js file as a module which can export variables or functions. Other modules can import things that exported. 

For example, imagine you have a class defined as a file game.js. You might export it like this:

```
class Game extends Scene {
    ...
}

export default Game
```

Every file can have a single `default` export. 

You might have a file with some utility functions that you wish to share with other modules. For example: 

```
const onResize = () => {
    ...
}

export onResize

const getSettings = () => {
    ...
}

export getSettings
```

Here the exports are not `default` exports, and there can be any number of these. 

To import exports use the following syntax: 

```
import Game from './game'
import { onResize, getSettings } from './utils'
```

In this example notice that `Game` was the default export, while `onResize` and `getSettings` are not `default` exports and must be surrounded by `{` and `}`. 

- https://developer.mozilla.org/en-US/docs/web/javascript/reference/statements/export
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import

## Phaser Challenges!

You've decided to make another game. Rather than write it all from scratch you've decided to use a library! This will allow you to implement complex features without having to invent them on your own from scratch. You heard [Phaser JS](https://phaser.io) is pretty good, and they just came out with version 3, time to code! 

Everyone is talking about libraries. They seem to be the big thing in web development. Anything bigger than the smallest projects could use a library to save time and make it easier to implement sophisticated features. 

You really need to learn some Phaser! Start with a tutorial. This tutorial creates a simple [platform game](https://en.wikipedia.org/wiki/Platform_game). 

- [Phaser 3 Tutorial](https://phaser.io/tutorials/making-your-first-phaser-3-game/)

Your goal is to complete the tutorial before the next class.

### Alternate Tutorials

Here are a few alternate tutorials you can try instead of the tutorial above. It's strictly up to you which you choose. 

- [Flappy Bird](http://www.lessmilk.com/tutorial/flappy-bird-phaser-1)
- [Breakout](http://www.lessmilk.com/tutorial/breakout-phaser)
- [2D Platformer](http://www.lessmilk.com/tutorial/2d-platformer-phaser)

### Challenges 

**Challenge 1**: Get the Phaser 3 Starter project running with Webpack. 

**Challenge 2**: Complete the tutorial. 

This tutorial is involved and has a lot of new ideas. Take notes along the way. There are a lot of new concepts here. you'll want to revisit these ideas after you have completed the tutorial. 

## Stretch Challenges 

**Stretch Challenge 1**: If you have completed the tutorial tries changing the artwork. This is a good start to learning how the system works. Check out these resources or make your own. 

- https://opengameart.org
- https://itch.io/game-assets/free
- https://www.gameart2d.com/freebies.html
- http://untamed.wild-refuge.net/rpgxp.php
- https://opengamegraphics.com
- https://www.glitchthegame.com/public-domain-game-art/

**Stretch Challenge 2**: Modify the tutorial project by changing the art and 'numbers'. Lookup some art on OpenGameArt.org or make your own. 

The numbers determine how the game plays., Numbers control everything including the speed, position, and size of objects. Read the code carefully and find some numbers and change them. Observe the results. 

**Stretch Challenge 3**: If you completed the first tutorial and have some time before the next class try one of the other tutorials. 

Build these alternate tutorials with the Webpack Starter.

## Resources 

- https://github.com/photonstorm/phaser
- https://github.com/soggybag/phaser3-project-template
- https://phaser.io/tutorials/getting-started-phaser3
- https://developer.mozilla.org/en-US/docs/web/javascript/reference/statements/export
- https://webpack.js.org
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import
