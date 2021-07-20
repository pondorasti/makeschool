<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.1 - Lesson 11 - Odds and Ends

<!-- Put a link to the slides so that students can find them -->

➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore')

<!-- > --> 

## Learning Objectives <!--2 min-->

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

## Using JS Libraries <!--5 min-->

**QUICK POLL:**

**Q:** In your JS files, where do you import libraries?

1. Before any of your code
1. In the middle of your code
1. After all of your code

<!--Import before any your code-->

**Q:** In your HTML files, where do you import JS?

1. At the top of the body tag
1. At the bottom of the body tag
1. In the header

<!--At the bottom of the body tag-->

<!-- > -->

## SmoothScroll <!--20 min-->

Have you ever been on a website where when you navigated it was a sudden motion? Similar to how when you do header navigation on GitHub. This can feel off putting, and sudden to users. Using the `scrollIntoView` method, we can control how smoothly we scroll.

[Check out this example](https://codepen.io/askd/pen/jZZEeG) of using `scrollIntoView`. Click on the headers to see the smooth scrolling in action. If you remove the `{ behavior: 'smooth'}` line, then you can see how not smooth scrolling can be!

For more info on how to use `scrollIntoView`, check out the [docs](https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollIntoView)! 

<!-- > -->

### Quick Aside: Check compatibility with "Can I Use". 

https://caniuse.com

https://caniuse.com/#search=scrollintoview

Note: Sounds like the 'smooth' option doesn't work in Safari! 

<!-- > -->

### Quick Aside: Polyfill

[https://developer.mozilla.org/en-US/docs/Glossary/Polyfill](https://developer.mozilla.org/en-US/docs/Glossary/Polyfill)

A pollyfill is a code that is used to add support for a feature that may not be supported in older browsers or for new features that haven't been implemented in all browsers. 

Google: SmoothScroll Polyfill

## Using SmoothScroll

The code snippet below will hijack all anchor (`<a>` tags) preventing their default behavior. If the `href` in the anchor is an id it will scroll that element into view. 

For example: 

```html
<a href="#contact">Contact</a>
```

The code above would scroll the element with the id contact into view: `<div id="contact">...</div>`

The function looks for the class `external`. Any anchor that has the class name extrnal will act as normal: 

```html
<a class="external" href="http://google.com">Search</a>
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

This is the concept of **event delegation**. Events are passed to ancestor elements in a process called bubbling. Since the body is the root ancestor we can be sure that any event will bubble up and can be handled by the body. 

Events add efficiency to your code because it allows you to use a single event handler for clicks on all elements (in this example).

## Waypoints <!--15 min-->

Waypoint.js is a library that creates events when an element is scrolled into view. 

[http://imakewebthings.com/waypoints/](http://imakewebthings.com/waypoints/)

Take a look at the guide:

[http://imakewebthings.com/waypoints/guides/getting-started/](http://imakewebthings.com/waypoints/guides/getting-started/)

A basic way point will execute a callback function when an element reaches the top of the page. 

To use Waypoints import the library:

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/noframework.waypoints.min.js"></script>
```

The link above loads Waypoints.js from a **content delivery network or CDN.**

### CDN

A Content Delivery Network is a server that hosts files used by servers. The goal is host common files and make access fast and easy. 

Advantages: Browser cache files based on the domain/url. Multiple websites that make use of the same files from a CDN will show a performance improvement since they will share the files from the cache. 

[https://www.cloudflare.com/learning/cdn/what-is-a-cdn/](https://www.cloudflare.com/learning/cdn/what-is-a-cdn/)

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

<!-- > -->

## 10 min Break

<!-- > -->

## Slide Show JS <!--30-40 min-->

There are many JS slides, BootStrap includes one. here is one that I made that includes a tutorial on how to write the JS code yourself. 

[https://github.com/soggybag/js-tutorial-slide-show](https://github.com/soggybag/js-tutorial-slide-show)

You can follow the tutorial or just use the code. 


<!-- > -->

## Review Poll <!--10 min-->

<!--https://docs.google.com/forms/d/1rFouIUeDfO8GeXWwWfZyNtMgFcF6YymMh5ASNQL4_40/edit-->

Let's do a quick review of the concepts we learned today!

[Library Review Poll](https://docs.google.com/forms/d/e/1FAIpQLSfZyT2cWckXBywlgfsb-l1aXOJoHOVyCPgecmm752XQqzsPPg/viewform?usp=sf_link)

<!-- > -->

<!--## Extra Challenge (if time permits)

In groups of 3-4, review one of the libraries, and then create a short activity (tutorial, exercise, worksheet, etc.) to help your peers learn it! 

- SmoothScroll
- Waypoints
- SlideShow-->


## After Class 

Start the final project. See the assignment description for the final in the link below. 

[Fianl Assignment](../assignments-08.md)