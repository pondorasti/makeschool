# FEW 1.1 - Semantic HTML

➡️ [**Slides**](https://make-school-courses.github.io/FEW-1.1-Web-Foundations/Slides/01-Semantic-Html/README.html ':ignore')

<!-- > -->

### Learning Objectives

- Describe semantic HTML
- Use Semantic HTML
- Write HTML with correct syntax
- Markup content and preserve context and meaning

<!-- > -->

### What is HTML?

The Language of the Web

HTML stands for "HyperText Markup Language", which refers to "hypertext" (i.e. links) in digital documents. The Web is, essentially, made up of lots of digital documents which link to each other.

<!-- > -->

### A Short History

In 1989 Tim Berners-Lee, a physicist at <a href="/wiki/CERN" title=""><abbr title="European Organization for Nuclear Research">CERN</abbr></a>, proposed a system for researchers to share documents. 

<!-- .element: class="fragment" -->

The system was an internet-based hypertext system. Hypertext is text displayed on a computer screen that uses hyperlinks to connect other documents.

<!-- .element: class="fragment" -->

![asdf](images/hyperlinks.gif)
<!-- .element: class="fragment" -->

<!-- > -->

### How do we use it?

HTML uses tags to "markup" a document. Tags describe and provide context to content. 

Below the `p`, or paragraph, tag describes the text Hello World as a paragraph. 

```html
<p>Hello World.</p>
```

The opening tag `<p>` is followed by a closing tag `</p>` which has a slash `/`.

<!-- > -->

### Combining Tags

Many different tags can be combined and nested one within another. 

```html
<article>
  <h1>HTML</html>
  <p><abbr>HTML</abbr> is the best!</p>
</article>
```

<!-- > -->

### Tags cannot overlap!

Good:

```HTML
<p><abbr>HTML</abbr> is the best!</p>
```

Bad: 
```HTML
<p><abbr>HTML</p></abbr> is the best!
```

(the `</p>` closes before the inner `</abbr>`)
<!-- .element: class="fragment" -->

<!-- > -->

## Semantic HTML

<!-- > -->

### What is semantic HTML?

**Semantic** (adj.): of or relating to meaning in language

To use a *word* semantically is to use a word in a way that properly aligns with its meaning.
<!-- .element: class="fragment" -->

**Semantic markup** is to use tags that properly align with the **content** the tags mark up.
<!-- .element: class="fragment" -->

<!-- > -->

### Some Examples

<!-- > -->

#### "Valentines day! ♥️"

How would you mark this up?
<!-- .element: class="fragment" -->

A time or date uses the `time` tag.
<!-- .element: class="fragment" -->

```html
<time>Valentines day! ♥️</time>
```
<!-- .element: class="fragment" -->

Or better
<!-- .element: class="fragment" -->
```html
<time datetime="2020-02-14">Valentines day! </time>
```
<!-- .element: class="fragment" -->

<!-- > -->

#### "HTML"

How would you mark this up? (seriously)
<!-- .element: class="fragment" -->

Abbreviations and acronyms use the `abbr` tag.
<!-- .element: class="fragment" -->

```html
<abbr>HTML</abbr>
```
<!-- .element: class="fragment" -->

Or, better
<!-- .element: class="fragment" -->

```html
<abbr title="Hyper Text Markup Language">HTML</abbr>
```
<!-- .element: class="fragment" -->

<!-- > -->

<abbr title="Hyper Text Markup Language">HTML</abbr> was invented by Tim Berners Lee.

<!-- > -->

#### "How would you mark this up? (seriously)"

```HTML
<p>How would <em>you</em> mark this up? <strong>(seriously)</strong></p>
```
<!-- .element: class="fragment" -->

`em` and `strong` are inline tags that control the voice of what you are saying.
<!-- .element: class="fragment" -->

<em>Always</em> use inline tags <strong>inside a block!</strong>
<!-- .element: class="fragment" -->

<!-- > -->

### Sarcasm

What about a sarcasm tag?  
<!-- .element: class="fragment" -->

Would this be useful? Discuss... 
<!-- .element: class="fragment" -->

What tags would find useful for communication? Discuss... 
<!-- .element: class="fragment" -->

<!-- > -->

### Some Rules

<!-- > -->

- Pairs end with / - `<p>...</p>`
- Some tags don't have a pair - `<hr>`
- Tags can't overlap! - `<p><time>Valentines day!</time></p>`
- Attributes are name value pairs the value is always in quotes - `<img src="./picture.png">`

<!-- > -->

### Activity

Pair up and research tags. 

https://developer.mozilla.org/en-US/docs/Web/HTML/Element

Take a look at what the HTML5 Dr has to say about your tags: http://html5doctor.com

Choose **one tag from each category** to present to your classmates. Include an example of the tags in use to show context.

<!-- > -->

1.
- address
- article, section, aside
- nav, main
- footer, header
- h1-6, hgroup

2.
- blockquote
- dd, dl, dt, ul, ol, li
- figure, figcaption
- pre, code

3.
- a
- abbr, time, 
- dfn
- i, b, u, strong, em, sup, sub
- mark, del, ins, q

4.
- area
- audio, video, source, img, track

- embed, iframe, object

- canvas
- details, dialog, menu, menuitem, summary

<!-- > -->

### BREAK 

Take a ten minute break and wrap a tag around everything you see. 

<!-- > -->

### Lab

Mark up challenges 1-4 here: https://github.com/soggybag/learn-semantic-markup. Choose the bext tags to describe the content of the text in each of these documents. 

Write a description for intensive project. Include the following information: 

- When you made it and a date
- Title or name of the project
- Why you made it, what is the rationale for creating this project. What problems does it solve? 
- Short description of the process and tools used. 
- Meta info, where is it hosted, where is the code, how to get started etc. 

<!-- > -->

- Markup your project description 
- Use semantic markup, use tags:
    - article
    - headings
    - Parargraphs
    - List
    - etc. 

<!-- > -->

## After Lab

Questions?

Pair up and markup the example text.

https://github.com/soggybag/learn-semantic-markup

<!-- > -->

### Homework 

[Assignment 1](../assignments/assignment-01.md) will be due at the beginning of next class. We'll submit it together during class.

<!-- > -->

### Wrap-Up 

- What were the learning objectives? 
- What is a learning Objective? 
- How would you check your understanding of the learning objectives? 

<!-- > -->

### What are learning Objectives? 

learning Objectives are the concepts and ideas that you need to know to claim mastery of a subject. When you have mastered a learning objective you will be able to explain it and put into practice. 

<!-- > -->

Test your knowledge by explaining the concept to someone else. 

Some learning objects you will implement in code. 

Others learnign objects are ideas that exist in the world at larger or are overaching ideas. 

<!-- > -->

### Additional Resources

1. http://html5doctor.com
1. https://en.wikipedia.org/wiki/HTML
1. https://developer.mozilla.org/en-US/docs/Web/HTML/Element
