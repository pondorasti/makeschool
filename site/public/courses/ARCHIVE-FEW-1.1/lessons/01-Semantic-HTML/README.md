# Semantic HTML

➡️ [**Slides**](https://make-school-courses.github.io/FEW-1.1-Web-Foundations/Slides/01-Semantic-Html/README.html ':ignore')

<!-- > -->

## What is HTML?

**The Language of the Web**

HTML stands for "HyperText Markup Language", which refers to "hypertext" (i.e. links) in digital documents. The Web is, essentially, made up of lots of digital documents which link to each other.

<!-- > -->

### A Short History

In 1989 Tim Berners-Lee, a physicist at <a href="/wiki/CERN" title=""><abbr title="European Organization for Nuclear Research">CERN</abbr></a>, proposed a system for researchers to share documents. 
<!-- .element: class="fragment" -->

The system was an internet-based hypertext system. Hypertext is text displayed on a computer screen that uses hyperlinks to connect other documents.
<!-- .element: class="fragment" -->

![asdf](assets/hyperlinks.gif)
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

A time or date uses the `time` tag.

```html
<time>Valentines day</time>
```

Abbreviations and acronyms use the `abbr` tag.

```html
<abbr>HTML</abbr>
```

<!-- > -->

### Nested Example

The `article` tag defines an article, an `h1` defines a heading, and a `p` tag defines a paragraph.

```HTML
<article>
  <h1>HTML</h1>
  <p>HTML define the structure of your HTML documents.</p>
</article>
```

***Important!*** Notice the article contains a heading and a content paragraph.

A heading would never contain an article.

<!-- > -->

### Activity

Pair up and research tags. 

https://developer.mozilla.org/en-US/docs/Web/HTML/Element

Choose **one tag from each category** to present to your classmates.

<!-- > -->

### Homework 

[Assignment 1](../assignments/assignment-01.md) will be due at the beginning of next class. We'll submit it together during class.

<!-- > -->

### Wrap-Up 

- What was covered today? 
- What does semantic mean? 
- What is semantic HTML?
- What is a tag? 
- What is an element?
- When do tags overlap? 

<!-- > -->

### Additional Resources

1. http://html5doctor.com
1. https://en.wikipedia.org/wiki/HTML
1. https://developer.mozilla.org/en-US/docs/Web/HTML/Element
