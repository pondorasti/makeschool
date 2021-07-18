# CSS Variables 

CSS variables are amazing. This is a new feature that has pretty coverage
at this time. Variables let you do things that were not possible before 
with CSS. They expand the possibilites and techniques you can bring to 
your web projects. They also give you a great new tool to improve your 
coding practice allowing you to make your code DRY and improve separation
of concerns. 

No, really, CSS varaibles are amazeballs!

## CSS Variables 

CSS variables allow you to assign values to idenitifers and use these in place of values
in style rules. 

Can't contactenate CSS variables with strings.

CSS variables are case sensitive.

Check support with:

```css
@support (--css: variables) {
  selector {
    /* Fall back styles */
  }
}
```

CSS variables can do math when they contain a unit! Use a number 
and convert to a unit with `calc()`

```css
--width: 100;

width: calc(var(--width) * 1px);
```

## Basic Usage 

Declare a variable:

```css
selector {
  --some-name: 20px;
}
```

Use a variable:

```css
selector {
  margin: var(--some-var);
}
```

Or use with a default value: 

```css
selector {
  margin: var(--some-var, 10px);
}
```

### Use variables to create DRY code

Use variables when a value appears more than once.

