<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 11 - Building and Publishing

<!-- Put a link to the slides so that students can find them -->
<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

## Hosting your React Projects with GitHub Pages

Hosting React projects on GitHub requires a little bit of extra work. React projects need to be built and bundled before they can be published to the web. 

### Working with Branches

Using the power of GitHub you can publish to a branch and continue to work and edit on your master branch. This workflow mirrors the work flow used by professionals.

Think of a branch as an alternative timeline of the work in a GitHub  repo. Yoiu might create a branch for reasons like: 

- Adding new features. Why use a branch for this? The new features might not be fully functional or they might be experimental and need to be tested before they made available for public use. 
- Creating an alternate version of your project. Why use a branch? You might not be sure these ideas will work and might want to go back to the previous version. 
- Published branch needs to functional while you work. What? If you're working on your project you might want to keep a copy that you know is working which is published. The working or development branch is now the place where your changes will appear. You can merge this with the development branch when it's ready. 

You're going to use the last idea today. You'll use the `gh-pages` package to create a branch of your work to GitHub Pages. 

### Building React Projects

The code you wrote in the `src` directory is not compatiblew with browsers. It needs to be processed. Think back to how you *bundled* your code as the last step with your Break Game. The process is at play here but comes as part of the create-react-app starter code. 

Besides minifying and uglifying your code building will take the JSX code you wrote, which is *not* compatible with the browser and turn it into code that is. 

```JS
import React from 'react'

function Footer() {
  return (
      <div>
          <h1>Hello</h1>
          <p>{new Date().toString()}</p>
      </div>
    )
}
```

Babel converts this code to standard JS. 

```JS
"use strict";

var _react = _interopRequireDefault(require("react"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function Footer() {
  return /*#__PURE__*/_react.default.createElement("div", null, /*#__PURE__*/_react.default.createElement("h1", null, "Hello"), /*#__PURE__*/_react.default.createElement("p", null, new Date().toString()));
}
```

This is minified to: 

```JS
"use strict";var _react=_interopRequireDefault(require("react"));function _interopRequireDefault(e){return e&&e.__esModule?e:{default:e}}function Footer(){return _react.default.createElement("div",null,_react.default.createElement("h1",null,"Hello"),_react.default.createElement("p",null,(new Date).toString()))}
```

Then uglified to: 

```JS
"use strict";var e=n(require("react"));function n(e){return e&&e.u?e:{"default":e}}function u(){return e["default"].createElement("div",null,e["default"].createElement("h1",null,"Hello"),e["default"].createElement("p",null,(new Date).toString()))}
```

While the differences here may not seem to be that great with a large project they add up making your projects load faster and use less bandwidth, this is all especially important for delivering a web experience over mobile devices.

Along the way all of these separate JS and CSS files are also combined into a single bundle.js file. 

So how does it work? Take a look at the README.md that was included with the create-react-app starter code. You'll see a few commands defined here: 

- `yarn start` - runs your project in development mode
- `yarn test` - launches the test runner
- `yarn build` - **builds your app for production to the `build` folder**
- `yarn eject` - ejects the project if you want to create your own build system

Where do all of these commands live? You'll find them all in `package.json`. Look for the scripts section: 

```JSON
...
"scripts": {
  "start": "react-scripts start",
  "build": "react-scripts build",
  "test": "react-scripts test",
  "eject": "react-scripts eject"
},
...
```

What happens when you build? React creates a build folder. It's this folder that you would upload to a web server for public consumption. This is process that I'm referring to as "publishing". 

Try it for yourself. Navigate your terminal to your react project folder. This can be your final project or the React Fundamentals tutorial folder. Once there run: 

- `yarn build`

Notice a build directory was created. It's this directory that you want to share with the world. You can publish this to your web host. The contents of the folder are processed and bundled for public consumption. 

But what about GitHub Pages and that branch we were talking about earlier? 

### GitHub Pages

GitHub pages is a free web hosting option that GitHub offers. It is limited to static pages you can't host serverside code but you can host all of the clientside JavaScript you like. This is perfect for your React projects. 

You can serve code from any or all of your GitHub repos. 

You can serve code from any branch in your GitHub repo. 

You'll be splitting your code into published a `gh-pages` branch that will served as a GitHub page, and the master branch which will be your developer code. The master branch is where you will make changes, fix errors and test your work. When you deem your work is ready for public consumption you'll publish to the `gh-branch`. 

### Using `gh-pages`

The process of creating a branch on GitHub and building you project to the branch is possible to do manually but easier with a tool and there is a tool made just for this! The `gh-pages` package does this for you. Try it for yourself. 

Before starting you'll need a React project that is on GitHub. Use your final project if it's on GitHub, don't worry if it's not complete you update and publish an update by running one command in the terminal. If your final project is not ready use the React Fundamentals tutorial. 

**Intall `gh-pages`**

Start by installing `gh-pages` package:

`npm install gh-pages --save-dev`

**Edit `package.json`**`

Edit your `package.json` add the following line at the root level of the JSON  object. 

`"homepage": "https://<username>.github.io/<repo-name>",`

**Replace `<username>` with your GitHub user name, and `<repo-name>` with the name of the for this project**

Watch the comma at the end! Don't lose this comma!

Find the scripts section and add these two lines.

```JSON
"scripts": {
  ...
  "predeploy": "npm run build",
  "deploy": "gh-pages -d build"
}
```

Be aware of the commas! You may need to add a comma on the line before `"predeploy": ...` or add a comma after `"deploy": ...`.

**Back to the terminal and publish your work**

Last, run in your terminal: 

`npm run deploy`

This should build your React project, compiling your ES6 and JSX into a JS bundle. Then, it creates a gh-pages branch on your GitHub repo and pushes your production code to this branch. 

**Making updates**

Make a change to your project. Save and commit. Then run: 

`npm run deploy`

This will build, commit and push the changes to the `gh-pages` branch. Do this each time you want to publish an update to your work. 

Note! It takes GitHub Pages a few minutes (5 mins sometimes) some times to see changes when they are pushed so be patient. 

**Note!** I had an error in the console that read: 

> `Failed to get remote.origin.url (task must either be run in a git repository with a configured origin remote or must be configured with the "repo" option).`

I had to run `xcode-select --install` to fix this. Not sure why, it probably had something to do with a system update. 

**React Router** 

If you are using React Router you must use HashRouter! BrowseRouter will not work with GitHub Pages! 

To make this fix you will probably only have to change a single line of code, most likely in App.js. 

Look for: 

`import { BrowserRouter as Router, Route } from 'react-router-dom'`

Change this to:

`import { HashRouter as Router, Route } from 'react-router-dom'`

Why is this needed? GitHub's server delivers a "fresh" for each unique router. For example if you're page is: `github.io/user-name/index.html`, and  `index.html` is a real file in your repo GitHub's server finds this and serves it. 

If internally your page generates a route like: `github.io/user-name/index.html/id/42` the GitHub server will look for the file 42 in the id folder, which probably doesn't exist. 

Remember! You are not writing the routes that handle requests. 

Why does HashRouter work? By inserting a hash the params you're adding to a route become part of the hash which doesn't change the file GitHub is serving. 

`github.io/user-name/index.html#/id/42`

Hashes are used to navigate internally! So: 

`github.io/user-name/index.html#contact` would navigate to the element with the `id="contact"` within the smae page. 

<!-- > -->

## Workshop Day

We will use this day to work on completing your final project.

<!-- > -->

## Learning Objectives (5 min)

1. Idenitfy areas for improvement
1. Idenitfy problems and strategies to solve them

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

1. Links to additional readings and videos


<!-- > -->

<!-- ## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | -------- | ------------ |
| 0:00 | 0:05 | [Why you should know this](#why-you-should-know-this) |
| 0:05 | 0:15 | [Learning Objectives](#learning-objectives) |
| 0:20 | 0:30 | In Class Activity I |
| 0:50 | 0:10 | BREAK |
| 1:00 | 0:45 | In Class Activity II |
| 1:45 | 0:05 | Wrap up review objectives | -->

<!-- > -->