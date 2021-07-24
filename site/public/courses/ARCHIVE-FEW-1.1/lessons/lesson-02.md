# FEW 1.1 - HTML Attributes

➡️ [**Slides**](https://make-school-courses.github.io/FEW-1.1-Web-Foundations/Slides/02-Forms-Links-Images/README.html ':ignore')

<!-- > -->

### Learning Objectives

1. Describe Attributes 
1. Use HTML tags and their attributes
1. Use HTML forms and form elements
1. Use the validator to write better HTML

<!-- > -->

### Why you should know this

The ability to generate well written and valid HTML is a requirement for any front end developer. You want to be solving bigger problems rather than tripping over HTML syntax. 

<!-- > -->

## Code Review 

Code review is a process of reviewing code before it is released. This is an important step used on the job. 

https://smartbear.com/learn/code-review/what-is-code-review/
https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/

### Pair up and review

As review you should look closely for semantic use of HTML elements. Especially these tages: 

- base html
    - html, head, title, and body
- semantic structure
    - section, article, header, footer
- semantic organization, and communication
    - h1-6, p, strong, em, etc.

Add your review comments to GitHub with issues. 

### Address issues

Take a look at the issues and adress them. Make the changes needed and close the issues. 

Save and commit. 

<!-- > -->

## Validation

Besides using humans to review your work software systems cna also be used. The HTML Validator will look at your files and check your work against the expected syntax. 

Use the https://validator.w3.org to validate your work. 

Solve any problems with validation. 

Save and commit. 

<!-- > -->

## Attributes

<!-- > -->

### What are attributes?

Tags can be modified/enhanced using **attributes**.

An attribute goes in the opening tag and is always in the form `name="value"`. Values are always quoted.

```html
<div class="warning">Help!</div>
```

<!-- > -->

### Multiple Attributes

Tags can have as many attributes as you care to include. 

```html
<img src="alien.png" width="64" height="64">
<input type="text" name="first-name" id="input-name">
```

Values are quoted even if they are numbers.

The order doesn't matter.

Many tags have attributes specific to them. 

<!-- > -->

## Images

<!-- > -->

### The img tag

The `img` tag displays an image. 

Semantically by using the `<img>` tag you saying there is a picture of something. This is different from images that are part of the design. 

<!-- > -->

The `<img>` has a few attributes: 

<div class="compact">
- src
- alt
- width & height
</div>

```html
<img src="apples.png" width="400" height="200" alt="Apple Tree">
```

<!-- > -->

## the input tag

<!-- > -->

The input tag is used to create a form input. It can appear in many different ways. It's important attributes are: 

- type
- name

```html
<input type="text" name="query">
```

<!-- > -->

`<input>` has a lot of possible types: 

- text - a text input

```html
<input type="text">
```

<input type="text" style="font-size:1.5em">

<!-- > -->

`<input>` has a lot of possible types: 

- **email** - email input

<form style="display:flex; margin: auto">
  <input type="email" style="font-size:1.5em">
  <button type="submit" style="font-size: 1em">Submit</button>
</form>

`<input type="email">`

<!-- > -->

`<input>` has a lot of possible types: 

- **password** - password input

<form style="display: flex; margin: auto">
  <input type="password" style="font-size:1.5em">
  <button type="submit" style="font-size:1em">Submit</button>
</form>

`<input type="password">`

<!-- > -->

`<input>` can also use placeholder

- text - a text input

<input type="text" style="font-size:1.5em" placeholder="Enter your name">

`<input type="text" placeholder="Enter your name">`

<!-- > -->

`<input>` has a lot of possible types: 

- number - numeric input

<form style="display: flex; margin: auto">
  <input type="number" style="font-size:1.5em">
  <button type="submit" style="font-size:1em">Submit</button>
</form>

`<input type="number">`

<!-- > -->

`<input>` has a lot of possible types: 

- range - a numeric range
- min - minimum value of the range
- max - maximum value of the range

<form>
  <input type="range" min="1" max="6" style="width:200px;height:40px">
</form>

`<input type="number" min="1" max="6">`

<!-- > -->

`<input>` has a lot of possible types: 

- color - color picker input

<form>
  <input type="color" style="width:100px; height:50px">
</form>

`<input type="color">`

<!-- > -->

Radio buttons are groups of buttons where only one of the group can be selected at any time. 

`<input>` has a lot of possible types: 

- radio - choose one

<form style="border:1px solid;padding:0.5em;margin:0.5em">
  <input type="radio" name="size" style="font-size:1.5em">
  <input type="radio" name="size" style="font-size:1.5em">
  <input type="radio" name="size" style="font-size:1.5em">
</form>

```html
<input type="radio" name="size">
<input type="radio" name="size">
<input type="radio" name="size">
```

<!-- > -->

Form elements should have a label. The label needs to be associated with the element. 

`<label>Medium</label>`

Labels make your checkboxes and radio buttons make more sense. They also help clarify your text inputs. 

<!-- > -->

<div style="display:flex">
<form style="width:250px; border:2px solid; padding:0.5em">
  <p>
    <label>
      <input type="radio" name="size" style="font-size:1em">
      Small
    </label>
  </p>
  
  <p>
    <label>
      <input type="radio" name="size" style="font-size:1em">
      Medium
    </label>
  </p>

  <p>
    <label>
      <input type="radio" name="size" style="font-size:1em">
      Large
    </label>
  </p>
</form>

```html
<form>
  <p>
    <label>
      <input type="radio" name="size">
      Small
    </label>
  </p>
  
  <p>
    <label>
      <input type="radio" name="size">
      Medium
    </label>
  </p>

  <p>
    <label>
      <input type="radio" name="size">
      Large
    </label>
  </p>
</form>
```
</div>

<!-- > -->

<div style="display:flex">
<form style="width:250px;border: 2px solid;padding: 0.5em">
  <p>
    <label>
      <input type="checkbox" name="size" style="font-size:1em">
      Caffeinated
    </label>
  </p>
  
  <p>
    <label>
      <input type="checkbox" name="size" style="font-size:1em">
      Notified
    </label>
  </p>

  <p>
    <label>
      <input type="checkbox" name="size" style="font-size:1em">
      Soulful
    </label>
  </p>
</form>

```html
<form>
  <p>
    <label>
      <input type="checkbox">
      Caffeinated
    </label>
  </p>
  
  <p>
    <label>
      <input type="checkbox">
      Notified
    </label>
  </p>

  <p>
    <label>
      <input type="checkbox">
      Soulful
    </label>
  </p>
</form>
```

</div>

<!-- > -->

<div style="display:flex">
<form style="width:250px; border:2px solid; padding:0.5em">
  <p>
      <input id="small" type="radio" name="size" style="font-size:1em">
      <label for="small">Small</label>
  </p>
  
  <p>
      <input id="medium" type="radio" name="size" style="font-size:1em">
      <label for="medium">Small</label>
  </p>

  <p>
      <input id="large" type="radio" name="size" style="font-size:1em">
      <label for="large">Small</label>
  </p>
</form>

```html
<form style="width:250px; border:2px solid; padding:0.5em">
  <p>
    <input id="small" type="radio" name="size">
    <label for="small">Small</label>
  </p>
  
  <p>
    <input id="medium" type="radio" name="size">
    <label for="medium">Medium</label>
  </p>

  <p>
    <input id="large" type="radio" name="size">
    <label for="large">Large</label>
  </p>
</form>
```
</div>

<!-- > -->

## Anchors

<!-- > -->

Anchors are text links that load new documents. These are the proverbial **hyperlinks**.

`<a href="http://google.com">Google</a>`

The `href` attribute sets the URL the link loads. 

<!-- > -->

Anchors/hyperlinks can link to elements in the same document. 

```html
<a href="#weather-report">Todays Weathwer</a>

...

<article id="weather-report">...</article>
```

The `href="#weather-report"` moves the element with the `id="weather-report"` to the top of the page. 

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
### BREAK [10 min]

<!-- > -->

### Homework

Complete [assignment 2](../assignment-02.md)

<!-- > -->

### Wrap Up

1. What is an attribute?
1. What is the syntax for attributes?
1. How to display an image? 
  - What are the attributes involved?
1. What is an `<input>`? 
  - What types are there?

<!-- > -->

### Additional Resources

1. https://smartbear.com/learn/code-review/what-is-code-review/
1. https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/
1. https://validator.w3.org

