<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - Lesson 11 - Odds and Ends

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > --> 

## Learning Objectives 

- Use JS libraries 
  - Use SmoothScroll
  - Use Waypoints
  - Use SlideShow 
- Identify compatibility for features 
- Describe a Polyfill
- Describe event delegation
- Describe Content Delivery Network
- Use a CDN

<!-- > -->

## Using JS Libraries 

- Always import them before your code
- Always import at the bottom of the body tag
- Your code goes last at the bottom of the body tag

<!-- > -->

## SmoothScroll

Scrolling the content of the window is a feature built into the Web API. 

https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollIntoView

Take a look at the docs and read the parameters. 

<!-- > -->

### Check compatibility with "Can I Use". 

https://caniuse.com

https://caniuse.com/#search=scrollintoview

Note: Sounds like the 'smooth' option doesn't work in Safari! 

<!-- > -->

### Polyfill

https://developer.mozilla.org/en-US/docs/Glossary/Polyfill

A pollyfill is a code that is used to add support for a feature that may not be supported in older browsers or for new features that haven't been implemented in all browsers. 

Google: SmoothScroll Polyfill

### Using SmoothScroll

The code snippet below will hijack all anchor (`<a>` tags) preventing their default behavior. If the `href` in the anchor is an id it will scroll that element into view. 

For example: 

```html
<a href="#contact">Contact</a>
```

The code above would scroll the element with the id contact into view: `<div id="contact">...</div>`

The function looks for the class `external`. Any anchor that has the class name extrnal will act as normal: 

```html
<a href="http://google.com">Search</a>
```

```JS
// Get a reference to the body
const body = document.querySelector('body')
// Listen for clicks
body.addEventListener('click', function(e) {
  // If a link has external class ignore it
  if (e.target.matches('.external')) {
    return
  }

  // Prevent the default behavior
  e.preventDefault()

  // Prepare to scroll
  // Get the href from the target
  const href = e.target.closest('a').href
  if (href) {
    // Select the current link
    selectNav(href)
    // Scroll to the id that matches the href
    const id = href.split('#')[1]
    document.getElementById(id).scrollIntoView({ 
      behavior: 'smooth' 
    });
  } 
})
```

### Event Delegation 

Look at the code snippet above. Notice it adds an event listener to the `<body>` tag. Really it wants to handle clicks on `<a>` tags. 

This is the concept of event delegation. Events are passed to ancestor elements in a process called bubbling. Since the body is the root ancestor we can be sure that any event will bubble up and can be handled by the body. 

Event adds efficiecny to your code because it allows you to use a single event handler for clicks on all elements in this example. 

## Waypoints 

Waypoint.js is a library that creates events when an element is scrolled into view. 

http://imakewebthings.com/waypoints/

Take a look at the guide:

http://imakewebthings.com/waypoints/guides/getting-started/

A basic way point will execute a callback function when an element reaches the top of the page. 

To use Waypoints import the library:

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/noframework.waypoints.min.js"></script>
```

The link above loads Waypoints.js from a content delivery network or CDN. 

### CDN

A content Delivery Network is a server that hosts files used by servers. The goal is host common files and make access fast and easy. 

Advantages: Browser cache files based on the domain/url. Multiple websites that make use of the same files from a CDN will show a performance imrpvement since they will share the files from the cache. 

https://www.cloudflare.com/learning/cdn/what-is-a-cdn/

### Using Waypoints 

The code below has an array of ids `['a', 'b', ...]`. Each of these would be the id of a div or section of content within the page. 

When that id scrolls into view the waypoint calls selectNav() and passes the id to this function. This funtion adds the `selected` class to one of the nav links and removes it from the others. 

```JS 
// --------------------------------------------
// Waypoints

['a', 'b', 'c', 'd', 'e'].forEach(function(id) {
  new Waypoint({
    element: document.getElementById(id),
    handler: function() {
      selectNav('#'+id)
    }
  })
})

// -------------------------------------------
// Show the selected nav link

function selectNav(id) {
  const navLinks = document.querySelectorAll('.nav-bar > a')
  navLinks.forEach(function(link) {
    if (link.getAttribute('href') === id) {
      link.classList.add('selected')
    } else {
      link.classList.remove('selected')
    }
  })
}
```

The nav bar might look like this: 

```HTML
<div class="nav-bar">
  <a href="#a">AAAA</a>
  <a href="#b">BBBB</a>
  <a href="#c">CCCC</a>
  <a href="#d">DDDD</a>
  <a href="#e">EEEE</a>
</div>
```

You might have this in your style sheet. 

```CSS
.nav-bar > a {
  display: block;
  text-decoration: none;
  padding: 1em;
  background-color: rgba(255, 255, 255, 0.5);
  color: #000;
}

a.selected {
  background-color: rgba(0,0,0,0.5);
  color: #fff;
}
```

## Slide Show JS 

There are many JS slides, BootStrap includes one. here is one that I made that includes a tutorial on how to write the JS code yourself. 

https://github.com/soggybag/js-tutorial-slide-show

You can follow the tutorial or just use the code. 



<!-- > -->

## After Class 

Start the final project. See the assignment description for the final in the link below. 

[Fianl Assignment](../assignments-08.md)

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

