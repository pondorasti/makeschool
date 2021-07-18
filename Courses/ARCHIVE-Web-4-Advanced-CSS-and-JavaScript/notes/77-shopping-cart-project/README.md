# Notes

SASS 

SASS is a lnaguage that compiles to vanilla CSS. SASS must be compiled 
first and can not be used by a browser directly. 

Why use SASS? 

SASS has many features that you may have wished existed in CSS. 

- variables
- loops 
- mixins (similar to functions)
- functions 

## SASS must be compiled

SASS or .scss files must be compiled to vanilla CSS beefore they can
be used by the browser. There are several tools that perform this 
task. 

### Desktop Tools

There are several desktop tools that will compile SASS to CSS. 

- [Koala](http://koala-app.com)
- [Scout](http://scout-app.io)
- [Code Kit](https://codekitapp.com/help/sass/)

You can also run SASS from the command line. 

- [SASS Compiler](http://sass-lang.com/install)

## Write some SASS

You'll write SASS the same as you'd write CSS. 

CSS is compiled into CSS just as you wrote it. 

### Variables 

Define variables in SASS. Variables names must begin 
with the `$`. Variables can be assigned any value that 
would be valid in CSS. 

### Nesting 

CSS doesn't allow rules to be nested. Selectors on the 
other hand can represent elements that are nested. 
SASS allows you to write nest rules that translate to 
nested selectors. 

### Partials Import

Partials are code snippets organized in files that SASS
can include 

### Mixins 

You can think of Mixins as functions that you define in 
SASS. Mixins take parameters and return CSS. 

### Extend/Inherit

SASS allows you to extend one class with the features of 
another. This a great way to minimize the code you 
write while keeping your code DRY. 

### Math and Operators

SASS supports a range of math operators and performs all
of the basic math. 

### Functions 

SASS allows you to define new functions that take parameters
and return any value. SASS provides built in helper functions 
that cover a range of utilities. 


## Challenges

Download Koala

Refactor the sample code

Build a 
