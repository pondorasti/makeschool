# SASS Intro

SASS is a langauge for creating CSS styles. SASS compiles to CSS.

install and run sass

## Challenges 

Install SASS. Follow the instructions [here](https://sass-lang.com/install) and explore the options, or follow the short version below and install the SASS CLI. 

`npm install -g sass`

Open index.html in your browser. 

Open the style.scss in your editor. This file is written in the SASS language which it looks like regular CSS. The current code here is plain CSS. 

Run the SASS compiler. 

`sass --watch style.scss style.css`

This starts the SASS CLI which will watch the `style.scss` file for changes and compile it into regular CSS code in `style.css`. 

The code here, like most CSS is not DRY, it tends to have a lot of repeated values and code. This is not uncommon because of the nature of CSS. 

SASS allows you to use variables, if statements, for loops, lists, and other structures not available in CSS.

### Challenge 1 - Variables

Look at the code and find all of the repeated values. Make a variable for each at the top.

SASS Variables begin with `$`!

```SCSS
$size: 200px;
$space: 20px;
$color: #f00;
$font-stack: Helvetica, Roboto, Arial;
$border-size: 1px;
$petals: 5;
```

Use your variables like this: 

```SCSS
.container {
  width: $size; // width: 200px;
}

.box {
  margin: $space; // margin: 20px;
}

h1 {
  font-family: $font-stack; // font-family: Helvetica, Roboto, Arial;
}
```

### Challenge 2 - Use your maths

use math operators to calculate values. SASS allows all of the typical math operator you see in other languages. 

```SCSS
$space: 20px;

.box {
  margin: $space; // margin: 20px;
}

h1 {
  ...
  font-size: $space * 2; // font-size: 40px;
}

button {
  padding: $space $space / 2; padding: 20px 10px;
}
```

### Challenge 3 - Use Nested Rules

Use nested rules to target elements. SASS will rewrite a nested rule with the descendant selector. 

```SCSS
.container {
  width: 200px;

  div {
    width: 120px;
  }
}
```

The rule above would compile to: 

```CSS
.container {
  width: 200px;
}

.container div {
  width: 120px;
}
```

### Challenge 5 - Add some comments 

There are a few comments already but you should add some more. SASS allows comments using `//` besides the standard `/* */`.

Look through the code and add soem comments: 

```SCSS
// Forground Color
$color: #f00;
// Base size
$size: 200px;
// Petal size
$petal-size: $size * 0.6;
```

### Challenge 4 - Use a loop

SASS provides loops. You can use these to generate repeated blocks of code. 

```SCSS
@for $i from 1 to 6 {
  // repeats from 1 to 5
}
```

Include the last value: 

```SCSS
@for $i from 1 through 6 {
  // repeats from 1 to 6 <- !!!!
}
```

Variables can be interpolated with `#{$i}`. For example imagine you wanted to create styles for h1-h6 tags: 

```SCSS
@for $i from 1 through 6 {
  h#{$i} { font-size: 7 - $i * 12px; }
}
```

Output CSS: 

```CSS
h1 { /* $i = 1  */
  font-size: 72px; /* 7 - 1 * 12px = 72px */
}

h2 { /* $i = 2  */
  font-size: 60px; /* 7 - 2 * 12px = 60px */
}

h3 { /* $i = 3  */
  font-size: 48px; /* 7 - 3 * 12px = 48px */
}

...
```

Create a series of class names with a loop: 

```SCSS
@for $i from 1 through 6 {
  .petal-#{$i} { color: red; }
}
```

Output CSS: 

```CSS
.petal-1 {
  color: red;
}

.petal-2 {
  color: red;
}

.petal-3 {
  color: red;
}

.petal-4 {
  color: red;
}

.petal-5 {
  color: red;
}

.petal-6 {
  color: red;
}
```

Use the loop count to calculate values. For example you could use the count to caluclate the hue of a color value: 

```SCSS
$petals: 5;
@for $i from 1 through $petals {
  $hue: 360 / $petals * $i;
  .petal-#{$i} { 
    background-color: hsla($hue, 100%, 50%, 0.2)
   }
}
```

Output CSS:

```CSS
.petal-1 {
  background-color: rgba(204, 255, 0, 0.2);
}

.petal-2 {
  background-color: rgba(0, 255, 102, 0.2);
}

.petal-3 {
  background-color: rgba(0, 102, 255, 0.2);
}

.petal-4 {
  background-color: rgba(204, 0, 255, 0.2);
}

.petal-5 {
  background-color: rgba(255, 0, 0, 0.2);
}
```

Notice the HSLA values were converted to RGBA. The colors are the same. This is seems to be the default behavior of SASS. 

