# Webpack 

Webpack is a powerful bundler. Use it to preprocess and compile your 
source files. 

## Set up 

`npm init -y`

Use Webpack 4. This is latest version currently in beta. 

`npm i webpack@next --save-dev`

Add the Command Line Interface.

`npm i webpack-cli --save-dev`

Add the following to package.json under `scripts`.

```
"scripts": {
  "dev": "webpack --mode development",
  "build": "webpack --mode production"
},
```

Add a directory named `src`. Then add a named `index.js` to this 
directory. 

Add some JavaScript to `index.js`. Write anything you like. 

Now run:

`npm run build`

Stuff should happen. When the dust settles Webpack should have created 
a new `dist` folder containing a file named `main.js`. 

The contents of this file should be minified. 

Try that again like this: 

`npm run dev`

This time the file is not minified. 

## Add Some SASS

`npm install sass-loader node-sass webpack --save-dev`




