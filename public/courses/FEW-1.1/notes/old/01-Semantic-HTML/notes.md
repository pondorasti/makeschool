# FEW 1.1 - Lesson 1

Semantic HTML

## Communication 

When we communicate with documents we use language. Language at it's most granular level is made up of letters and punctuation and rules of syntax and grammar. 

Above this we arrange the words and punctuation into sentences, paragraphs, titles, labels, lists, quotes, citations, and more. When you write a document, you might give it a title and write a paragraph or two of text and add your signature. 

> Happy Birthday!
>
> Hi mom, I hope you have a really excellent birthday! Sorry I couldn't make your party I'm still in the antarctic studying penguins. 
>
> - Jan Hammer

Reading this we intuit the first line as the title or subject, the next line is a single paragraph, and the last line as a signature or citation. 

The first line tells us what the document is about, it's subject, the second is the body of the document, and last tells who or where it came from. 

HTML or Hyper Text Markup Language is the language use to translate written documents into digital documents. The document above might be written: 

```html
<article>
  <h1>My Summer vacation</h1>

  <p>I took a summer vacation to study penguins in the antartic. They waddled acorss the ice and I did science. It was more fun than it sounds. </p> 

  <p>- Jan Hammer</p>
</article>
```

Here we have an article. It has a title, followed by two paragraphs. The first has a couple sentences, and the last includes the name of the author.

HTML is a language that is used to mark up documents using tags. 

HTML is written in plain text files. 

Tags are written with a name between `<` and `>`. Tags enclose some content and the closing tag includes a `/`. Here are a few examples: 

- `<h1>The title goes here</h1>`
- `<p>Contains a paragraph.</p>`
- `<article>An article...</article>`
- `<blockquote>Quoting someone...</blockquote>`

There some rules of syntax that must be followed when writing HTML. 

- The opening tag `<h1>` doesn't have a slash `/`
- The closing tag `</h1>` begins with a `/`

There is also some vocabulary

- The term tag refers to `<h1>`, `<p>` etc.
- The term element refers the tags an everything between: `<h1>My Summer Vacation</h1>`

The purpose of HTML is to use tags to describe the purpose of each element to communicate for effectively. 

In the example above the whole thing is an article (everything is contained in the `<article>` tag). 

The topic/title of the article is "My Summer Vacation". This is contained `<h1>` and `</h1>`. 

There is a message that is a single paragraph. We can tell this is single paragraph because it begins with `<p>` and ends with `</p>`. 

You can add even more context to your markup with the tags available. Consider these additions. 

```html
<article>
  <header>
    <h1>My Summer vacation</h1>
    <p>An amazing experience</p>
    <p>
      <time datetime="2009-10-09">3 days ago</time>
    </p>
  </header>

  <p>I took a summer vacation to study penguins in the antartic. They waddled acorss the ice and I did science. It was more fun than it sounds. </p> 

  <footer>
    <p>- Jan Hammer</p>
  </footer>
</article>
```

Here the I've added the `<header>` and `<footer>` tags. I've used these to designate the header of the article and the footer.

Notice the header and footer don't contain the content. This should seem obvious if you think about how you would write this article. 

Take a close look at the header. Notice there is a subheading. I didn't use a another heading tag like h1, h2, etc. because I'm not creating starting a new article or a new idea. Think of headings as things that would go in the index of your publication. 

Notice the time tag. If we have a date or time we can mark it up. Look closely at the tag. 

`<time datetime="2019-10-09">3 days ago</time>`

The `datetime="2009-10-09"` within the opening tag is called an attribute. These are always written in the form of `name="value"` and the value is always in quotation marks. If the date is written as "3 days ago" it might be hard for an computer service to work with, while a human reader would have any easier time with this over a numeric date. Attributes contain meta information that isn't displayed but adds details and context to the contents of the element. 

## Structure 

HTML also applies structure to a document. The h1 is inside the article tag, this means it's the title of this article. The two p tags are inside the article tags so they are part of this article that is titled by the h1. 

Syntax rule: 

- Tags can NOT overlap. 
  - `<article>This is an article<p>This is a paragraph</article></p>` BAD!
  - `<article><p>This is a paragraph inside an article</p></article>` GOOD!

Here is some more vocabulary. 

- A tag within another tag is called a child and the tag above it is it's parent. 

```html
<parent>
  <child>...</child>
</parent>
```

```html
<article>
  <p>...</p>
</article>
``` 

Here the article is the parent and the p is the child. 

```html
<article>
  <h1>...</h1>
  <p>...</p>
  <p>...</p>
</article>
``` 

All of the tags at the same "level" are called siblings. In this case `h1`, `p`, and `p` are all siblings. These all share the same parent `article`. 

```html
<ancestor>
  <parent-child>
    <descendant-child></descendant-child>
  </parent-child>
  <child></child>
</ancestor>
```

The ancestor refers to a containing element that is higher than your parent. Descendant is a term used for children that are nested deeper. 




