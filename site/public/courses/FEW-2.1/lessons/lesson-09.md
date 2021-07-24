<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - Bundling Libraries

<small style="display:block;text-align:center">Bundling Libraries for distribution</small>

This class session covers the concept of bundling. This is the process of combining files and processing them for use and distribution. 

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->

## Review: Callbacks!



<!-- > -->

## Promises

Let's study Promise! try these Replits! The first three review Promise and the last provides a practical use case and challenge!

- https://replit.com/@MakeSchoolFEW/Promise-01#readme.md
- https://replit.com/@MakeSchoolFEW/Promise-11#readme.md
- https://replit.com/@MakeSchoolFEW/Promise-12#readme.md
- https://replit.com/@MakeSchoolFEW/Promise-02#readme.md
- https://replit.com/@MakeSchoolFEW/Promise-03#readme.md

Solve this problem with Primsies and Callbacks. The sample code shows hoe to use the browsers geolocation API. It uses two callbacks. Your goal is to make it work with a Promise! 

- https://replit.com/@MakeSchoolFEW/GeoLocation#script.js

## Why learn how to bundle files? 

All of the files you have been using that you imported from another source were bundled. Understanding the process gives you a better understanding of the JavaScript and web application ecosystem. 

Bundling your files allows them to be distributed so they can be used anywhere without extra work. 

Bundling files also processes your files for different environments. Your files need to be handled differently if they are used in the browser, or in NodeJS, or in a React project. 

<!-- > -->

## Learning Objectives 

1. Describe reasons for bundling files
1. Define UMD and ESM bundles 
1. Use Rollup to bundle your library for distribution

## Bundling code with Rollup

Bundling is the process of processing and combining files together into a single file. For this section you'll use Rollup.js. Here is how Rollup describes itself: 

> Rollup is a module bundler for JavaScript which compiles small pieces of code into something larger and more complex, such as a library or application. It uses the new standardized format for code modules included in the ES6 revision of JavaScript, instead of previous idiosyncratic solutions such as CommonJS and AMD.   

Rollup describes itself as a "module bundler for JavaScript". Sounds like what we need! 

What types of different environements will your code be run in? 

- Browser
- Node

The Browser has an engine that runs your JS code. Node is an environment that runs your JS code. While they they both use JS they are different. 

<!-- > -->

**What's the difference?**

With node you're scripting the server. Imagine a single computer where you have control over the configuration. 

With browser imagine millions of mysterious computers where you have no control over configuration. 

<!-- > -->

The **browser** uses the script tag:

```HTML
<!-- Browser -->
<script src="somefile.js"></script>
```

Newer ES6 JS syntax uses **ES Modules** Syntax:

```JS
// ES6/ES2015 modules (React)
import package from 'module-name'
```

Node.js uses **CommonJS**:

```JS
// NodeJS (Express JS)
const package = require('module-name')
```

<!-- > -->

**That's too many options what should I do?** 😱

If you're working in Node.js use Common JS with `require()`

If you're writing code for the browser you'll need to support older browsers that don't support the ES Modules. This means you need to support both the script tag and ES Modules.

<!-- > -->

**But what if my library could be used in both Node and the Browser?**

You need to support both all three: CommonJS, ES, Modules, and Script tag. 

<!-- > -->

**There's a tool for that!**

UMD (Universal Module Definition) supports both `<script>` tag and `require()`

There are several tools that will bundle your JS files into compatiple formats. 

<!-- > -->

### Common JS 

**CommonJS is the pattern used with Node JS projects.** To use the code in a library you've written for Node.js and Expres.js projects by extension you'll need to bundle your code as a CommonJS Module. This will allow your code to be used like this: 

```JavaScript
const yourCode = require('your-code')
...
yourCode.yourMethod()
```

<!-- > -->

### UMD (Universal Module Definition) 

**UMD is used for code used in a script tag in the browser.** A UMD module be imported via the script tag _and can be imported with `require()` in a Node JS environment._ 

```JavaScript
<script src="your-code.js"></script>
<script>
  ...
  yourCode.method()
  ...
</script>
```

<!-- > -->

### ES Modules 

**ES Modules are used with ES6 Import from syntax.** ES Modules are the modules used with React and modern JS. These use the `import` and `export` directives. 

```JavaScript
import { yourMethod } from 'your-code'
...
yourMethod()
```

These modules might be further processed with babel before they are used. 

<!-- > -->

## Recap: Modules

- Modules are used to make code compatible across different environments. 
- There are several different module formats
  - CommonJS
  - UMD 
  - ES

<!-- > -->

## Bundling files with rollup

- https://thedrearlight.com/blog/delivering-js-modules.html

Follow the instructions below to bundle your project with rollup.js.

Install rollup.js 

`npm install --save-dev rollup`

<!-- > -->

Create a config file for rollup. Make a new file named `rollup.config.js`. 

```JavaScript
export default {
  input: 'src/index.js',
  output: {
    file: 'umd/your-module.js',
    format: 'umd',
    name: 'yourModule'
  }
};
```

**Change the name of the input file to point to your source code.**

**Change the output file name to the name of your library.**

**Chaneg the name in the output to the name of the variable your code will be stored in.**

This base config takes an input file from: `src/index.js` and outputs a UMD file `umd/your-module.js`. 

<!-- > -->

When loaded this file will create a global variable named `yourModule`. Remember UMD format is meant to be loaded in the browser. The code is also wrapped in a function following the CommonJS module pattern for use with Node JS. 

Move your source files into a folder named `src` create this folder if you haven't yet. 

In your source code change the import and export syntax. Rollup will recognize the `import from` syntax. So we will use that:

```JS
// Change
module.exports = SomeThing
// To
export default SomeThing
```

<!-- > -->

Test your work so far. 

`npx rollup --config`

This should build the UMD module from your source files and save these a folder named `umd`. 

Rollup should have created `umd/your-module.js`. Take a look at this file. it contains the boiler plate code that manages your module/bundle. 

<!-- > -->

If you saw a warning: `(!) Generated an empty bundle` you may need to export code from  `src/index.js`. For example 

```JS 
function getWeather() {
  ...
}

export { getWeather }
// or 
export default getWeather
```

<!-- > -->

**Test your module.** 

Make a test file: `example.html`. Import your script with the script tag: 

```HTML
<script src="./umd/just-in-case.js"></script>
```

Notice the path to your library, it points to the `umd` folder at the file named in your config file.

Write some test code in your test file. Load the text file in the browser. 

The module should also work with Node.js. Try creating `server.js`. Use this to import your module: 

```JS
const yourModule = require('./your-module')
console.log(yourModule.method())
```

### Configure Rollup

The source code has not been minified. You can minify using Terser.js plugin for Rollup. 

Import `Terser.js` plugin for RollUp. 

`npm install --save-dev rollup-plugin-terser`

<!-- > -->

Modify `rollup.config.js`: 

```JavaScript
import { terser } from 'rollup-plugin-terser';

export default [
  {
    input: 'src/index.js',
    plugins: [terser()],
    output: {
        file: 'umd/your-module.js',
        format: 'umd',
        name: 'yourModule',
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

Notice there are two outputs. The second 'esm' is for ES Modules. These don't need to be minified since they are consumed by other bundlers and won't benefit from minification. 

Modify `package.json`. We need to make sure that importers of the library get the right file. Set "main" for Node JS environments.

```JSON
  ...
  "main": "umd/your-module-name-here.js",
  ...
```

Use "module" to designate ES Module.

```JSON
  ...
  "module": "esm/index.js",
  ...
```

<!-- > -->

Use "files" to designate which files should be distributed by npm. 

```JSON
  ...
  "files": [
    "esm/*",
    "umd/*"
  ]
  ...
```

<!-- > -->

Add "prepare" script. This script is run by npm each time you install or publish. 

```jSON
  ...
  "scripts: {
    ...
    "prepare": "rollup --config",
    ...
  }
  ...
```

<!-- > -->

### Testing your work

Pair up with someone you haven't paired with before. The goal will be to test the build system. You'll do this by following the instructions below. 

Start here: 

`npm pack`

This command is like `npm publish` it prepares your files but doesn't send them to the server. Use `pack` to test your work locally. When you're satisfied use `publish` to upload to npm. 

Run your tests

`npm test`

You may need to point your tests to the UMD folder since the tests are run with Node JS. 

```js
// in your test.js
const yourModule = require('../umd/your-module')
```

If everything is good commit and push to GitHub. 

Check your Status on Travis. 

Check your Coverage on Coveralls.

<!-- > -->

Take a look at your package on npm. Check the version number. 

You can test the Node JS version of the package using the "RunKit" link.

(I had a problem with this showing an outdated version.)

Create a test project for your package. 

<!-- > -->

Create a new folder and initialize a new npm project. 

`npm init -y`

Import your package. 

`npm i your-module`

Make an HTML file to test in browser 'example.html'.

Add the script tag. 

```HTML
<script src="./node_modules/your-module/umd/your-module.js"></script>
<script>
 console.log(yourModule)
 console.log(yourModule.method())
</script>
```

<!-- > -->

Note the path is pointing to the file in node_modules. You'll need to customize the second script to work with your code. 

Test your work in Node JS. Make a new file `server.js`. 

```JavaScript
const yourModule = require('your-module')

console.log(yourModule)
console.log(yourModule.method())
```

<!-- > -->

Again, modify the code here to test your library code. 

Test your code in a React project. 

Create a new React app. 

`npx create-react-app your-module-react-test`

<!-- > -->

Import your module. 

`npm i your-module`

Write some test code in `App.js`

```JavaScript
import { yourMethod } from 'your-module'

console.log(yourMethod())
```

<!-- > -->

Wow, that's some pretty thorough testing! If you did everything here you've done everything that all of the professional developers are doing when they publish to npm. 

<!-- > -->

### Code Coverage

Code coverage is a term that talks about what percentage of your code is covered by testing. You should strive for 100%. This is not always possible due to the nature of some code. As part of continuous integration, code coverage is a metric that gives another way to look at the quality and reliability of our code. 

<!-- > -->

**Run Coverage**

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

<!-- > -->

Let's read the coverage summary closely. 

- File - Which files were tested? 
- % Stmts - What percentage of statements in the program have been executed? 
- % Branch - Has each branch in a control structure been executed? 
- % Func - What percentage of functions have been executed? 
- % Lines - What percentage of executable lines of code have been executed? 
- Uncovered Line #s - Which lines have not been covered by testing?
  - The line numbers refer to code in the lib folder! This is the compiled code not the source code in the 'src' folder. In the example test.js imports from './lib'.

<!-- > -->

Take a look at your code and figure out: 

- What hasn't been tested
- Which branches haven't been executed
- Functions that have been tested

https://medium.com/@krishankantsinghal/how-to-read-test-coverage-report-generated-using-jest-c2d1cb70da8b

<!-- > -->

### Pair programming 

Take some time to pair program and solve issues with your code. You'll split the time half focussed on one project and half focussed on the other. 

The goal of this session is to 

Pair up with someone you haven't paired with before. 

<!-- > -->

## Homework

[Math Lib](./assignments/assignment-05.md)

<!-- > -->

## Additional Resources

Set up Jest with babel to use ES6 import from with your tests

- https://jestjs.io/docs/en/22.x/getting-started.html#using-babel
- https://medium.com/@saplos123456/using-es6-import-and-export-statements-for-jest-testing-in-node-js-b20c8bd9041c

More info on bundling

- https://levelup.gitconnected.com/code-splitting-for-libraries-bundling-for-npm-with-rollup-1-0-2522c7437697



<!-- ## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | Bundle files with RollUp  |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | Code Coverage pair and test |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         | -->

