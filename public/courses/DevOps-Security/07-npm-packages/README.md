# npm packages

NPM is the most popular package manager today and if 
you have worked with Node JS you have probably used 
NPM. 

## Introduction

Packages are libraries of code that you can incorporate 
into projects you work on. 

NPM is a registry that manages and serves over 600,000 
packages! These are all maintained by community contributors. 

## Write and Publish a package to NPM

- Make an NPM account
- Start creating a new Package hosted on GitHub
  - Think of a name. Your package needs a name. 
  All of the common names have been taken. 
    - Search NPM for the name to avoid conflicts
  - Create a new GitHub project with these settings: 
    - Name the project with the of your package
    - Initialize your repo with a README
    - Add .gitignore: Node
    - Add a License: MIT (or your choice)
  - Clone the project locally
- Login `npm login`
  - Set your author name: `npm set init.author.name Joe Smith`
  - Set your email: `npm set init.author.email "joesmith@gmail.com"`
  - Set your author URL: `npm set init.author.url "http://www.joesmith.com"`
- Navigate in the terminal to your GitHub project
- Init a new NPM project `npm init`
  - Use these settings
    - Version `0.1.0`
    - test `mocha --reporter spec`
- Add a new file to the project 'index.js'
- Add your code to 'index.js'
  - Better to write a small module that does one thing. 
  - Import other modules if necessary with `require()`
  - Code with `module.exports`
- Write a Read Me
- Commit and Push to GitHub
- Publish to NPM `npm publish`

## Update Your Package

Follow these steps after making changes to your package: 

- Update your GitHub Project
  - `git add .` 
  - `git commit -m "commit message"`
  - `git push origin master`
- Update the NPM package
  - `npm version patch -m "Version %s - message"`
    - Add `--force` if needed...
  - `npm publish`
  
Follow these steps when using a package in a project to update
to the latest version. This might useful when testing to get 
latest version after doing the update above. 

- Use `npm outdated` to see which packages have been updated. 
- Use `npm update` to update to the latest version. 
  
Follow the tutorial [here](https://codeburst.io/how-to-create-and-publish-your-first-node-js-module-444e7585b738)
This tutorial has great info. 

## Challenges

Following the tutorial above:

- Create and Publish a package to NPM
- Stretch Goals
  - Add Unit tests
  - Add Continuous Integration
  - Add Coverage
  - Add Badges to your GitHub repo

## Resources 

- https://codeburst.io/how-to-create-and-publish-your-first-node-js-module-444e7585b738
- https://docs.npmjs.com/getting-started/creating-node-modules
- https://docs.npmjs.com/getting-started/publishing-npm-packages
- https://lexi-lambda.github.io/blog/2016/08/24/understanding-the-npm-dependency-model/