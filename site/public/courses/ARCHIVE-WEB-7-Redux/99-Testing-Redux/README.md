# Testing Redux 

Testing is important you should do it. 

## Introduction

Testing your reducers is a good idea. 

## Setup Testing 

- dev dependancies 
  - mocha 
  - chai 
  - babel-preset-es2015
  - react-addons-test-utils
  
`npm i --save-dev mocha chai babel-preset-es2015 react-addons-test-utils`

Add a Test script

```JSON
"scripts": {
  ...
  "test": "mocha --compilers babel-core/register ./src/tests/*test.js",
  ...
}
```

Add file: '.babelrc'

```
{
 "presets": ["react", "es2015"]
}
```

