<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 2.1 - Lesson 9

<small style="display:block;text-align:center">TypeScript Part 2</small>

Let's continue our work from last week on using TypeScript in an existing (or new) project!

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > -->

## Learning Objectives 

1. Recall basic types from last class
1. Modify an existing code base to use TypeScript
1. Rewrite tests in TypeScript using Jest
1. Install and use linting software using eslint-typescript

<!-- > -->

## Adding Types to FizzBuzz

If you haven't already, clone the FizzBuzz repository here: https://github.com/Make-School-Labs/fizz-buzz-test

Modify the FizzBuzz code _and_ tests to use types. Include at least one class or interface in your implementation.

<!-- > -->

## Testing using Jest

Instructions adapted from https://basarat.gitbooks.io/typescript/content/docs/testing/jest.html

Install Jest using npm:

```bash
npm i jest @types/jest ts-jest -D
```

<!-- > -->

Add a `jest.config.js` file to the root of your project and initialize it with the following:

```javascript
module.exports = {
  "roots": [
    "<rootDir>/tests"
  ],
  "transform": {
    "^.+\\.tsx?$": "ts-jest"
  },
}
```

<!-- > -->

Now you can run `npx jest` to run your tests.

You can also add the following to your `package.json`:

```json
{
  "test": "jest"
}
```

This allows you to run with `npm t`.

<!-- > -->

## Linting with typescript-eslint

Follow [this tutorial](https://www.npmjs.com/package/eslint-config-airbnb-typescript) on configuring with the Airbnb Style Guide with TypeScript. Follow the instructions for "no React support". You may need to install ESLint plugins if you haven't already.

<!-- > -->

Next, to get typescript-eslint integration in your VSCode editor, follow [this tutorial](https://medium.com/@oliver.grack/using-eslint-with-typescript-and-react-hooks-and-vscode-c583a18f0c75) under "Telling VSCode that ESLint checks our TypeScript":

After installing the ESLint extension in VSCode, go to `Code > Prefrences > Settings` and click the button with `{}` to go to the JSON settings view. Enter the following into the JSON file:

```json
"eslint.validate": [
  "javascript",
  "javascriptreact",
  {
    "language": "typescript",
    "autoFix": true
  },
  {
    "language": "typescriptreact",
    "autoFix": true
  }
]
```

<!-- > -->

For more information on configuring eslint, you can read their [User Guide](https://eslint.org/docs/user-guide/configuring). 

For example, if you want eslint to ignore your Jest global variables, you can add the following:

```js
env: {
    "jest": true
}
```

<!-- > -->

## Homework

[Assignment 7 - API Lib](../assignments/assignment-07.md)

<!-- > -->

## Wrap Up

- Continue working on your current tutorial
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

1. 

<!-- > -->

## Minute-by-Minute [OPTIONAL]

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |
