# Core Markdown

Markdown is a simple mark up language that was designed to be easy to 
read and easy to write. 

> A markup language is a system for annotating a document in a way that 
> is syntactically distinguishable from the text. The idea and 
> terminology evolved from the "marking up" of paper manuscripts, i.e., 
> the revision instructions by editors, traditionally written with a 
> blue pencil on authors' manuscripts.
> - **Wikipedia**

## What is Markdown

Markdown is a **lightweight markup** language with **plain text** formatting 
syntax. It is designed so that it **can be converted to HTML and many other 
formats**. 

**Markdown is often used to format readme files**, or writing **messages in 
online discussion forums**, and to create rich text using a plain text editor.

**John Gruber created the Markdown** language in 2004 in collaboration with 
**Aaron Swartz** on the syntax, with the goal of enabling people: 

> "to write using an easy-to-read, easy-to-write plain text format, and 
> optionally convert it to structurally valid HTML".

You can use Markdown in GitHub, Slack, and many forums and other online tools
and services. 

## What does it look like

Markdown looks like this: 

```
# Title heading

Plain text cna be written as plain text. 

Words can be made **bold** or *italic*. 

You can create lists

- Apple 
- Banana
- Cheese

And ordered lists 

1. Airplanes
2. Boats
3. Cars

Add a horizontal rule 

---  

You can create [links](google.com)

And images:

![Image](o.png)

Quotes

> The breaking of a wave cannot explain the whole sea.
> - **Vladimir Nabokov**

You can even make tables 

| name  | price | qty | cost |
|-------|-------|-----|------|
| apple | 0.99  |  2  | 1.98 |
| banana| 1.29  |  1  | 1.29 |
| total |       |  3  | 3.27 |

<div>HTML renders as HTML (<a href="https://github.com/github/markup">most of the time</a>)</div>

```

The code above renders as this in GitHub: 

---

# Title heading

Plain text can be written as plain text. 

Words can be made **bold** or *italic*. 

You can create lists

- Apple 
- Banana
- Cheese

And ordered lists 

1. Airplanes
2. Boats
3. Cars

Add a horizontal rule 

--- 

You can create [links](google.com)

And images:

![Image](o.png)

Quotes

> The breaking of a wave cannot explain the whole sea.
> - **Vladimir Nabokov**

You can even make tables 

| name  | price | qty | cost |
|-------|-------|-----|------|
| apple | 0.99  |  2  | 1.98 |
| banana| 1.29  |  1  | 1.29 |
| total |       |  3  | 3.27 |

<div>HTML renders as HTML (<a href="https://github.com/github/markup">most of the time</a>)</div>
--- 

## Why use Markdown?

Discuss with a partner the pros and cons of Markdown. 

- Easy to write
- Plain Text it very portable
- Widely used

## Markdown

There is no clearly defined Markdown standard, apart from the original writeup 
and implementation by John Gruber, which some consider **abandonware**. 
This has led to fragmentation as different vendors write their own variants of 
the language to correct flaws or add missing features.

This discussion will cover the GitHub flavor of Markdown. 

### A closer look at Markdown

[Take a look at the GitHub Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

#### How to use Headings 

Headings come in levels 1 to 6. Heading 1 is the most important 
heading on the page and should probably contain the title of the 
page. 

A level 1 heading should only appear once on a page. Or once at 
the top of a story or article. 

After a level 1 heading use a level 2 heading. Always use the next 
numbered heading for a subtopic. 

#### How to use Lists 

Lists come in two flavors, ordered and unordered. An ordered list shows
a number to the left of each item an unordered list shows a bullet. 

Use lists anytime you have things that shoud be grouped together or 
need to be presented in steps. 

If the order matters use an ordered list. 

#### Emphasis

Use a emphasis to draw attention to an element. If it's important
stress it with emphasis. 

If it's really important or you feel you want to say something 
with a bold voice say it strongly.

#### Code 

Always markup code samples. You can do this inline or in blocks. 

`let x = 10` is better than `var x = 10`

or 

```
let x = 10 // this is best 
var x = 10
```

#### Tables 

Use tables to display tabular data. Anytime you want arrange things 
in rows and columns use a table. 

#### Images 

Use images when you can. Your GitHub READMEs will will always look better
with an image or two. 

You can reference images locally with the file name or a path. 

#### Links 

Use a link when appropriate. Links can link to any of the following. 

- local files or folders
- external urls 
- internal

## Github READMEs

What to put in a README

### What makes a good README

- https://gist.github.com/PurpleBooth/109311bb0361f32d87a2

#### Awesome READMEs

- https://github.com/matiassingers/awesome-readme

#### Those badges 

- https://github.com/dwyl/repo-badges

- npm tag
- gitter chat
- say thanks https://saythanks.io
- https://github.com/esell/hoptocopter


## Other things you can do with Markdown

- `npm install --save marked` compiles markdown to html n JavaScript. 
- https://github.com/iwasrobbed/Down Swift markdown renderer

## Resources 

- Branding yourself
  - https://builttoadapt.io/why-a-personal-brand-is-necessary-for-todays-developer-f0f18bfaa033

## Schedule 

| Time  | Total | Activity    | Description   |
| ------|-------|-------------|---------------|
| 10min | 10min | Talk        | Intro         |
| 10min | 20min | Think Pair  | where have you seen Markdown? |
| 10min | 30min | Talk        | Markdown      |
| 10min | 40min | Think Pair  | Pros and cons of Markdown |
| 10min | 50min | Talk        | Why your GitHub READMEs are important |
| 10min | 60min | Think Pair  | Find 3 projects on GitHub with great READMEs |
| 10min | 70min | Work        | Use the template to re-write one of your READMEs |
| 10min | 80min | Pair        | Slack your GitHub repo and review another repo |

