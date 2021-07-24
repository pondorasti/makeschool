# FEW 1.1 - HTML Attributes

➡️ [**Slides**](https://docs.google.com/presentation/d/1Cb60k46G3NmK7qyoiGpHzo8FMGRcvrk97XgLfmQn78Y/edit?usp=sharing ':ignore')

<!-- > -->

## Submit Homework in Gradescope <!--5 min-->

Take some time right now to submit your homework into gradescope if you haven't already!

<!-- > -->

## Warmup <!--7 min-->

Breakout groups of 3, answer these questions:

- Say hi to your partners!
- What’s an HTML tag? Share an example.
- What is the purpose of HTML? 
- What is semantic HTML? 
- If your partner doesn’t know support their learning until they understand!

<!-- > -->

## Learning Objectives <!--(3 min)-->

1. Describe Attributes 
1. Use HTML tags and their attributes
1. Use HTML forms and form elements
1. Use the validator to write better HTML
1. Describe a tree structure

<!-- > -->

### Why you should know this

The ability to generate well written and valid HTML is a requirement for any front end developer. You want to be solving bigger problems rather than tripping over HTML syntax. 

While writing HTML is considered an easy task, and many developers don't pay much attention to it, using semantic concepts can set you apart making you a better developer with a deeper understanding, writing better quality code. 

<!-- > -->

## Code Review <!--(30 min)-->

Code review is a process of reviewing code before it is released. This is an important step used on the job. 

### Activity: Read and Discuss

Read the following article on [What Is Code Review](https://smartbear.com/learn/code-review/what-is-code-review/)

With a partner, discuss the 4 code review approaches, and write out the pros/cons to each. Which one is your favorite, and why?

**Further Discussion** read up on these [10 best practices for code reviews](https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/), and discuss why you think these are best practices? Why should we follow these?

### Pair up and review

As review you should look closely for semantic use of HTML elements. Especially these tages: 

- base html
    - html, head, title, and body
- semantic structure
    - section, article, header, footer
- semantic organization, and communication
    - h1-6, p, strong, em, etc.
- Look for syntax errors, for example missing closing tags or closing tags missing the /
- Look at style, does the indentation help readability. 
- Look for spelling mistakes like `<haeder>` or `<boyd>`

With a partner, define how you would use each of these above HTML elements. What other elements could you use, and how would you use them?

<!-- > -->

## Validation <!--(10 min)-->

Besides using humans to review your work software systems can also be used. The HTML Validator will look at your files and check your work against the expected syntax. 

Use the https://validator.w3.org to validate your work. You can upload a file, or type in the code directly, and it will return a list of syntax errors/warnings that it finds.

Try it out! Use one of your own HTML files, or go copy/paste HTML from your favorite website and see what it says!

<!-- > -->

## Attributes <!--(10 min)-->

<!-- > -->

### What are attributes?

We use attributes to add meaning to elements marked up with tags. While a tag might mark something up as a time/date we might not know exactly when. Consider: 

`<time>Next Wednesday</time>`HTML

vs 

`<time datetime="2020-08-05">Next Wednesday</time>`HTML

Or imagine you have a link that says "Contact" the actual address might be something more complex and less readble. Without the URL the link would be useless!

`<a href="http://mysite.com/contact.html">Contact</a>`HTML

An attribute goes in the opening tag and is always in the form `name="value"`. Values are always quoted.

```html
<div class="warning">Help!</div>
```

<!-- > -->

**Multiple Attributes**

Tags can have as many attributes as you care to include.

```html
<img src="alien.png" width="64" height="64">
<input type="text" name="first-name" id="input-name">
```

- Values are _always_ quoted even if they are numbers!
  - `src="alien.png"` 
  - `width="64"` 
  - `height="64"`
- The order doesn't matter. (these are all the same)
  - `<img src="alien.png" width="64" height="64">`
  - `<img width="64" height="64" src="alien.png">`
  - `<img height="64" width="64" src="alien.png" >`
- Many tags have attributes specific to them.
  - `<img src="alien.png" width="64" height="64" alt="Alien">` Uses height, width, src, and alt
  - `<input type="text" name="first-name" id="input-name">` Doesn't use height, width, or alt

<!-- > -->

Attributes are used by the browser to glean meaning from a tag. Attributes can also be used to store more information with a tag. For example you might want to make a link that displays the name of the product but also knows the PLU number and vendor id. 

```HTML
<a 
  href="http://paypal.com" 
  data-plu="102938" 
  data-vendor="0s9d8asj7j929635">New Fangled Thing</a>
```

The PLU and vendor id would not look great displayed on the page. Instead they are hidden in the attribute and available to the process that runs when the link is clicked.

These are _developer defined_ attributes. You, the developer, can make them up. Developer attributes _always begin with_ `data-` followed by any name.

<!-- > -->

## Activity: Attribute Practice <!--(15 min)-->

As we go through the rest of this section, utilize the trinkets below to get some extra practice with adding attributes yourself!

[https://trinket.io/html/81a953369e](https://trinket.io/html/81a953369e)

<!-- > -->

## Images <!--(5 min)-->

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

## the input tag <!--(10 min)-->

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

## Forms <!--(10 min)-->

**Form** elements are how we collect information from users! We collect that information through the `input` elemetns that we've been building so far. Think of a `form` as a container that we will put all of our `input` elements in, and the form will also signal where to send the form data. But we'll revisit that later.

Each input within a form should have a label:

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

## Anchors <!--(5 min)-->

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

## Check for understanding <!--7 min-->

Answer the following questions on your own (2 min), then pair with another student and discuss in a breakout room (2 min). We'll discuss as a group at the end (3 min):

1. What are 2 reasons you should do code reviews?
1. What are some common attributes for the following elements, and what are those attributes used for?
    1. `img`
    1. `a`
    1. `input`
1. In addition to containing our `input` elements, a `form` is also used for what other purpose?

<!-- > -->

<!-- .slide: data-background="#087CB8" -->

## BREAK <!--[10 min]-->

<!-- > -->

## Lab

Start working on [Homework 2](../assignments/02-Markup-Attributes-Forms.md)! We'll go over it and use the remainder of class to work on it.

Submit one question you have about the homework to the class slack channel!

<!-- > -->

### Wrap Up

1. What is an attribute?
1. What is the syntax for attributes?
1. How to display an image? 
  - What are the attributes involved?
1. What is an `<input>`? 
  - What types are there?

Remember to submit one question you have about the homework to the class slack channel!

<!-- > -->

### Additional Resources

1. https://smartbear.com/learn/code-review/what-is-code-review/
1. https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/
1. https://validator.w3.org

## HTML and the DOM

One of the most important features of HTML to understand is that it is a data structure. The tags that you write create elements that all have a relationship with the elements around them. 

Consider: 

```HTML
<body>
  <article>
    <header>
      <h1>Hello!</h1>
      <small>Sent:<time date-time="2020-08-20">Today</time></small>
    </header>
    <p>What a nice day</p>
    <footer>
      <p>From: Mitchell</p>
    </footer>
  </article>
</body>
```

Every element here has a relation with the others. There is a language for it! The vocabulary is important to understand and use because it allows you to communicate with other developers and gives you stronger mental model of what is going on in your code! 

- Parent
- Child
- Sibling
- Ancestor 
- Descendent

Apply these names to the code sample above. 

### What is the DOM?

DOM Stands for Document Object Model and it is the structure created by all of the elements your tags define. 
