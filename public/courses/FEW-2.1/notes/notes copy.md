# FEW 2.1 JS Libs 

Modern JS is processed and bundled before use. The steps below outline one system for bundling JS for use in different environments and for distribution. The process explained here uses RollUp. 

https://levelup.gitconnected.com/code-splitting-for-libraries-bundling-for-npm-with-rollup-1-0-2522c7437697

- Bundling and modules 
  - best practices 
    - functions do one thing
    - a lib solves one problem or provides a single service
  - What the heck is a module? 
    - How many different formats are there? MNy head is spinning...
    - ES Module (ECMAScript Module)
    - Scope Hoisting
    - Tree Shaking
  - Use RollUp
    - What kind of bundles for which purposes
      - single bundle - script tag
        - ...example code...
      - CommonJS - require() node
        - ...example code...
    - install 
      - `npm install --save-dev rollup`
      - touch rollup.config.js
```
export default {
    input: 'src/main.js',
    output: {
        file: 'umd/module-name.js',
        format: 'umd',
        name: 'moduleName'
    }
};
```
  - This instructs RollUp to look at src/main.js and bundle it and it's dependencies into a UMD (Universal Module Definition) in the file umd/module-name.js. The name option tells rollup to which global variable to create when the script is used in the script tag: moduleName in this case. This will only be use when the module is not used in a Node environment. 
  - Test this yourself by running `npx rollup --config`
  - UMD bundles should be minified to save space. You can do this with TerserJS which is a fork of Uglify.js that supports modern ES2015 JS. 
    - `npm install --save-dev rollup-plugin-terser`
  - Add it to the `rollup.config.js`
```
import {terser} from 'rollup-plugin-terser';
export default [
    {
        input: 'src/main.js',
        plugins: [terser()],
        output: {
            file: 'umd/your-module.js',
            format: 'umd',
            name: 'yourModule',
            esModule: false
        }
    },
    {
        input: 'src/main.js',
        output: {
            file: 'esm/index.js',
            format: 'esm'
        }
    }
];
```
  - Modify package.json to make sure that importers of the your library receive the correct UMD file: see "main", for the ESM file: see "module", Make sure the files are included with NPM: see "files". Add a "prepare" script which is run by npm when you run npm install or publish. 
```
{
  "name": "fancy-case",
  "version": "1.0.0",
  "main": "umd/fancy-case.js",
  "module": "esm/index.js",
  "scripts": {
    "prepare": "rollup --config"
  },
  "files": [
    "esm/*",
    "umd/*"
  ],
  "devDependencies": {
    "rollup": "^1.1.0",
    "rollup-plugin-terser": "^4.0.2"
  }
}
```
  - publish your lib
    - `npm publish`
  




---- 




Steps to bundle Justincase

`npm install --save-dev rollup`

Create rollup.config.js

```
export default {
    input: 'src/index.js',
    output: {
        file: 'umd/just-in-case.js',
        format: 'umd',
        name: 'justInCase'
    }
};
```

`src/index.js` code source files

UMD build

`npx rollup --config`

Make a test file: example.html. Import your script with the script tag: 

`<script src="./umd/just-in-case.js"></script>`

Notice the path to your library uses. It points to the umd folder at the file named in your config file. 

Write some test code that works with your lib. 

Examine the source code that was written. It is pretty obscure. Note that it is using one of the module patterns evolved. 

Notice the out code is not minified. It should be. 


Import Terser.js plugin for RollUp. 

`npm install --save-dev rollup-plugin-terser`

Modify `rollup.config.js` 

```
import {terser} from 'rollup-plugin-terser';

export default [
  {
    input: 'src/index.js',
    plugins: [terser()],
    output: {
        file: 'umd/just-in-case.js',
        format: 'umd',
        name: 'justInCase',
        esModule: false
    }
  },
  {
    input: 'src/index.js',
    output: {
      file: 'esm/index.js',
      format: 'esm'
    }
  }
];
```
Notice there are two outputs. The second for ESModules doesn't apply Terser for minification since es modules are consumed by other bundlers and don't benefit from minification. 

Modify `package.json` to make sure importers of the library get the right files. 

Set "main" for node environments. 
```
"main": "umd/jus-in-case.js",
```

Use "module" to designate ES Module
```
"module": "esm/index.js",
```

Use "files" to designate which files should be distributed by npm. 
```
"files": [
  "esm/*",
  "emd/*"
]
```

Add "prepare" script. This script is run by npm each time your install or publish. 
```
"scripts: {
  ...
  "prepare": "rollup --config",
  ...
}
```

Test your work so far with 

`npm pack`

Publish to npm 

Bump the version number in `package.json`

Publish to npm 

`npm publish`

Check Travis for a status update. 

Build a test project to test your package. Make a new folder. Initialize an npm project. Install your package. 

Test node environment. Add a new file server.js. Import your package with require() and test some of it's methods. 

Test with a browser. Setup a script tag that points to your module in the umd folder. Write some code to test your module. You'll need to open this in a browser. 



=================================
=================================




## Why build with Webpack?

Just because you wrote the code doesn't mean it's usable everywhere. Your ES6 JS might not run in a browser or in a Node environment. While you could write the compatible code you'd need to updated it manually. 

The solution, write modern JS in ES6 and transpile to ES5, Commonjs, and other forms to make your code universal!

## Learning Objectives

1. Explain the uses and advantages of transpiling
1. Use Babel to transpile 
1. Use Webpack to automate processes
1. Identify code coverage (lines, branches, and functions that have not been tested)

## Transpiling 

A transpiler is a tool that reads code written in one programming language and outputs equivalent code in another language. JS is so widely used across so many systems there is a lot of fragmentation. Code you write today might work in the latest version of Chrome but doesn't work in the last version if Internet Explorer, and needs a few extra lines or changes to be compatible with a Node.js environment. 

It's all JavaScript but not quite the same langauge. 

We handle transpiling with [Babeljs.io](https://babeljs.io). Go to [Try it out](https://babeljs.io/repl). Paste the source code from your Math lib into the left pane. 

The right pane shows how Babel transpiles your code. There are options on the left to adjust how Babel writes the code. 

Q: Whay kinds of changes di you spot? 
Q: What do think these changes do?

Q: Why transpile and learn Babel? 
A: You'll see it everywhere, and it will make your code universally compatible in all JavaScript environments. 

https://scotch.io/tutorials/javascript-transpilers-what-they-are-why-we-need-them

## Modules, CommonJS, and IIFEs

JavaScript code runs in a wide variety of environments. 

- Browsers (and there are many of these)
- Node.JS (uses JS but is different)

There are two things that are important to understand here. 

- Making code safely available 
- Making code compatible

Scripts written in the script tag or imported with the script tag in the browser all run in the same environment. No matter where a script is defined all of it's code is thrown into a common pool of code. 

Quick everyone write some pseudo code. We need some code that takes orders for products, and tracks the number of orders submitted. 

- function that takes an order for a product. It should take the id of the product, the number to order 
- You need a variable that counts the number of total orders. This increments with each order. 

List the variable and function names on the board. 

Using all of these code together creates a clash. More than one of these functions and variables uses the same identifiers. 

We could use an IIFE to isolate our code from other code: 

```
(function() {
  var count = 0

  function orderCookies(name, number) {
    count += 1
    console.log(name, 'placed an order' )
  }
})()
```

Q: What is the scope of `count` and `orderCookies`

This isolates your code from all of the other code. Problem you can't access this code from outside. This is where the concept of modules come in. Modules use the pattern above with additional code that returns elements that you want to be publicly accessible.

This problem has been solved through commonjs and requirejs. Thes 

### Modules 

The module pattern allows a developer to define a scope for variables and functions that is seprate from everything else in the program. This is handled through the use of IIFE (Immediately Invoked Function Expressions). 

### UMD (Universal Module Definition)

Take a quick look at this article. 

https://www.davidbcalhoun.com/2014/what-is-amd-commonjs-and-umd/

You don't ever have to write this code. Instead Babel will take your code and wrap in one of these module defintions. 

## Build Tools: Webpack 

Modern JavaScript applications process files, transpile, and bundle them together. Webpack is currently the most popular tool for this. 

Q: Why? Too many to do justice in this lesson. here are the big ones. 

- **Transpiling** for compatibility
- **Preprcessing** JS and SASS, and minify
- **Bundling** files
- **Reporting** code coverage and testing
- **Utility processes** like launching local sever and watching files for changes

transpiling for browser compatibility is important. This allows you to write code in any form of JS and be sure it will run in the same way in any environment. 

Preprocessing files. SASS for example, must be processed and turned into vanilla CSS. This is a requirement. You couldn't use SASS unless it was converted to vanilla CSS. 

Minifying is the process of minimizing the size of files before they used in the application. This saves decreases load times. Essentially this is the process of removing all of the unnecessary characters including comments and white space. This is important since you as a developer want to include comments for good code quality but these comments increase your load size! Minifying also replaces the names of functions and variables with shorter names. If you used letter names for each variable and function you'd be decreasing the file size but your code would be impossible to read! 

Bundling files is the process of taking many small seprate files and combining them into a single "bundle". This is saves load times since your app now only needs to load a single file. You also don't have to manage links to many files which could save you some organizational overhead. 

In short it's a pretty good idea. 

## Build Lib with Webpack

The steps here build a simple library from scratch using all of the concepts from class with the addition of Webpack. 

### Step 1 - Getting started

Make a new folder. Initialize an npm project:

`npm init -y`

### Step 2 - Use Module Exports 

Let's write a simple library with a couple functions that illustrate how to work in both the browser and node. 

make a new file `index.js`

```
// code here... ????????????
```

- Assign functions to module.exports
- Global values, classes and ... ???

### Step 3 - src directory 

Everything builds from src. Your source code are the files you maintain and the files that are processed, transpiled, and bundled. 

- Make `src` directory and move source code (index.js) here. 
- Set the entry point in package.json to: `"main": "src/index.js"`

Test this by run 

`node`

At the prompt 

`> var mylib = require('.')`

Test your lib 

`> mylib`

Call a method...

If you've used modern JS you'll errors!!!!!!!

Node doesn't fully support all of the new ES6 features. Use Babel to convert your code into ES5 universally compatible code. 

### Step 4 - Install Babel

Here you'll add and configure Babel.

`npm i -D @babel/core @babel/cli @babel/preset-env`

Add a new file `.babelrc` in the root directory.

```
{
  "presets": [
    "@babel/preset-env"
  ]
}
```

package.json

`"build:commonjs": "babel src --out-dir lib",`

Run the script: 

`npm run build:commonjs`

Webpack processes and creates a bundle in `lib/index.js`. The input file came from `src/index.js` and was output to `lib/index.js`. We need to set a new entry point in `package.json`.

`"main": "lib/index.js",`

Try testing your package in node. 

Start the node environment: 

`node`

Require your package: 

`var lib = require('.')`


See your stuff on this: 

`this` 

(should log `this` to the console)

Call methods on lib: 

`lib.lottery()`

`Number([1,2,3,4,5,6])`

Take a look at `lib/index.js` compare this file to `src/index.js`. The second is the source code we wrote. The first is the processed and bundled code. 

You can see that the code is working in a Node environment. What if we wanted this code to also work in the browser? 

### Build a UMD Bundle 

The code above works with Node but we need a universal module that can be used in Node or in a Borwser. 

Make a new file in your root directory: `webpack.config.js`

Add the following code to `webpack.config.js`

```
const path = require('path')

module.exports = {
  output: {
    filename: 'test-module.js',
    library: 'testModule',
    libraryTarget: 'commonjs2'
  }
}
```

Here you are naming the output file and the name of the module. You'll have a file you can import in a node environment: 

`require('test-module.js')`

For browsers this will give us an object on the window object with all of our methods and properties attached to it. 

`window.testModule`

Use Webpack to create the bundle: 

`npx webpack` or `webpack`

This should create: 

`dist/test-module.js`

Take a look at `test-module.js` the code here looks a little weird. It's minified, has some extra code added that is part of the Universal Module Definition standard. Scroll all the way to the right you should be able find some of your source code modified to run everywhere.

You should also see a warning in the terminal. 

> WARNING in configuration
> The 'mode' option has not been set, webpack will fallback to 'production' for this value. Set 'mode' option to 'development' or 'production' to enable defaults for each environment.
> You can also set it to 'none' to disable any default behavior. Learn more: https://webpack.js.org/concepts/mode/

We didn't set the mode when ran webpack so webpack defaulted to 'production' mode. This why the code was minified. There might be times when you want to work in development mode and have more readble code. 

Try: 

`npx webpack --mode=development` or `webpack --mode=development`

Take a look at `dist/test-module.js`. It's a lot easier to read now. There is a lot of extra code and comments. This code has not been minified. It has been made compatible with older browsers and the Universal Module Defintion.

`node`

`> require('./dist/test-module.js')`

Add a couple build scripts to `package.json`:

```
"build": "npm run build:commonjs && webpack --mode=production", 
"build-dev": "npm run build:commonjs && webpack --mode=development", 
```
















### Step 9 - Add Coverage 

Test your coverage 

`npx jest --coverage`

You should see something like this: 

```
...
  console.log lib/index.js:14
    index.js

----------|----------|----------|----------|----------|-------------------|
File      |  % Stmts | % Branch |  % Funcs |  % Lines | Uncovered Line #s |
----------|----------|----------|----------|----------|-------------------|
All files |    73.33 |    36.36 |    61.54 |     69.7 |                   |
 index.js |    73.33 |    36.36 |    61.54 |     69.7 |... 26,34,51,56,61 |
----------|----------|----------|----------|----------|-------------------|
Test Suites: 1 passed, 1 total
Tests:       4 passed, 4 total
Snapshots:   0 total
Time:        1.583s
Ran all test suites.
...
```

Let's read the coverage summary closely. 

- File - Which files were tested? 
- % Stmts - What percentage of statements in the program have been executed? 
- % Branch - Has each branch in a control structure been executed? 
- % Func - What percentage of functions have been executed? 
- % Lines - What percentage of executable lines of code have been executed? 
- Uncovered Line #s - Which lines have not been covered by testing?
  - The line numbers refer to code in the lib folder! This is the compiled code not the source code in the serc folder. In the example test.js imports from './lib'.

Some code added via Babel will create branches that do not get tested. This is soemthing we can live with for now.  

https://medium.com/@krishankantsinghal/how-to-read-test-coverage-report-generated-using-jest-c2d1cb70da8b

### Step 5 - Travis 

.travis.yml

```
language: node_js
node_js:
  - node
```

push these changes check travis.com and wait patiently...

#### Add coveralls 

`npm i -D coveralls`

package.json -> "scripts"

`"coverage": "npm test -- --coverage",`

Update `.travis.yml` to run this run your coverage script when you push to GitHub. 

```
language: node_js
node_js:
  - node
script:
  - npm run coverage -- --coverageReporters=text-lcov | coveralls
```

Commit and push to GitHub. Wait patiently for Travis to begin it's build. When this is complete check with Coveralls. 







https://nmackey.com/library-webpack-babel/

Good tutorials does it all (maybe too much)
https://medium.com/@TeeFouad/a-simple-guide-to-publishing-an-npm-package-506dd7f3c47a

Webpack Authoring Libraries 

https://webpack.js.org/guides/author-libraries/

Great guide to Webpack 4

https://www.valentinog.com/blog/webpack/

NPM package publish with Webpack: https://tech.namshi.io/blog/2016/07/20/the-copy-paste-guide-foror-creating-npm-packages-in-es6-with-babel-and-webpack/

Concepts
- Build systems 
- Bundle
- Webpack
  - Which version? -> 4+
- Transpiling
- Babel
- Plugins 
  - Processing HTML and CSS loaders
- Webpack dev server

Building and publishing React Components

https://medium.com/dailyjs/building-a-react-component-with-webpack-publish-to-npm-deploy-to-github-guide-6927f60b3220












## Best practices

- functions should do one thing
- a library should solve one problem

Code bundling 
Code splitting
Modules CommonJS, CommonJS2, ES Modules
- ES Module https://exploringjs.com/es6/ch_modules.html
Scope Hoisting https://medium.com/adobetech/optimizing-javascript-through-scope-hoisting-2259ef7f5994
Tree Shaking https://medium.com/@Rich_Harris/tree-shaking-versus-dead-code-elimination-d3765df85c80

## Publishing NPM libs 

Write a lib with x utility functions. 

### Testing 

Write unit test for your lib from the previous assignment. 

### Continuous Integration

Setup Travis CI and Code Climate and score some sweet badges!

## Higher Order Components 

Higher order component used for a library served through NPM. 

Writing a function that takes a component and possibly other things returning component with super powers. 

### Testing React Components with Jest

Write tests for your component from the previous assignment. 

