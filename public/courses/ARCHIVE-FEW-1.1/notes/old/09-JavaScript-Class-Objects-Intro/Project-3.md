# Make a Website with Dynamic Data

Your job is to create a web site where the content is dynamically generated. 

## Why?

- This is how many web sites are built.
- Use these ideas to build sites that work with web APIs.
- Separating content from structure makes more flexible sites

## How?

First define a data structure that describes the content of your site. 
What types of things would this contain? 

### Content 

- Menu and navigation
  - Links have a title and URL
- Title and meta info
  - Site title - shown in the title bar
  - Display title - shown on the page
- Content might might come in different varieties
  - Page content - Might describe everything in a page
  - Section content - might describe everything in a section
    - 
  - Article content - might describe a unit of content
    - This could be content like blog posts, projects, stories, products
  - Content data - What is content? 
    - Title
    - Subtitle 
    - Short description/summary 
    - Publish Date
    - Updated Date
    - Author 
    - Content text
    - Meta info - other information that describes or supports this content element
      - tags, categories, links

## Data Structures
    
tl;dr Objects and Arrays FTW!

Arrays store data based on index, and holds elements in an order. 
Use an array to keep lists of like elements, especially when the order matters. 

Objects store data based on named keys, there is not order. Use 
an object when you want to get at specific piece of data. 

Your site has a a list of navigation links. An array is best. You have a group 
of related items and the order matters. 

Each navigation item needs a label, and a URL. An object works best here. The order
doesn't matter, getting at specific information is more important. When you want the title 
you want the title not the URL. 

From a high level you'll probably want to start with an Object. This will allow 
you to group categories of information. 

```
{
  title: ""
  nav: []
}
```

For one off elements just use an Object. The site has a single title and base URL, 
but you might need more info to describe the site an object might be best here. 
Each of the items is unique. 

```
{
  sitemeta: {
    title: "",
    url: "",
    contactLink: ""
    ...
  }
  nav: []
}
```

Navigation would be good as an array but each item is probably best as an object
since the elements of a navigation item is unique. 

```
{
  sitemeta: {
    title: "",
    url: "",
    contactLink: ""
    ...
  }
  nav: [
    {title:"Home", url:"..."}, 
    {title:"About", url:"..."},
    {title:"Portfolio", url:"..."}
  ]
}
```

How you handle content depends on the content. Content elements will most likely 
be objects, these might be stored in an array or might be attached to keys. 

```
{
  ...,
  homePage: {title: "", summary: "", ...},
  aboutPage: {title: "", summary: "", ...},
  projects: [
    {title: "Project 1", content: ""},
    {title: "Project 2", content: ""},
    ...
  ]
}
```

Your goal is to put a content object together and use it to populate your website. 
