# Class - FEW 2.3 - Assignment 5

## Description 

Single page applications are built from a single page but they are not much use if they are only one page. Using React Router you can make React sites act like multipage web sites. A good place to practice this would be in the portfolio site you have been working on! 

### Why this assignment?

Displaying only a single page of content has some limitations. Knowing how to display multiple pages of content in your single page sites is good skill to have in your tool box. 

## Project requirements

Your goal is to implement React Router to your portfolio project. Imagine your project as multiple pages. Ask yourself these questions:

- What are _pages?_ 
- What content _needs_ it's own page?
- What appears on _all_ pages?
- How do you _navigate_ from one page to another?

Content displayed by hiding and displaying react components. Ask youself these questions: 

- Where will a Route/Component will be displayed? 
- What Link will display the Component? 
- What is the path used for this Route/Component?

Generally you'll be using router to display a component as static content or dynamic content. 

For static content you can include all of the content information inside the component used in a route.

For dynamic content you'll want to pass the data the component will display through the Link that displays the component. 

The last question to ask youself is where the component will be displayed. A Route displays a component at the location where you have placed the Route. 

### Challenges 

**Challenge 1** Add React Router to your project. Use `HashRouter`. 

- `npm install react-router`

**Challenge 2** Setup some basic routes. You'll most likely want to setup router in your App or top level component. 

- `import { HashRouter as Router } from 'react-router'`
- Make `Router` the top level element in your in your top level component

**Challenge 3** Add some static content. You'll need some Routes and some NavLinks. Each NavLink and Route will share a path. 

- Define two or more `<NavLinks>` 
- Define two or more `<Route>`

**Challenge 4** Create some dynamic content. Here you will define a Route that receives data from the Link that displays it. 

- Pass data through the link. 

```jsx
<Link 
  to={{
    pathname:"/details",
    state: data // Pass props through Link
  }}
>
```

**Challenge 5** Add some styles! NavLinks can have an active/selected style. Use this to your advantage. NavLinks should be links that are visible while content changes, for top level navigation. 

The selected link should have a style tjhat sets it apart from the other links to show that it represents the current page. This is common and good UI/UX. 

```jsx
<NavLink 
  className="PageHeader-link" 
  activeClassName="selected" 
  exact 
  to="/"
  >Home</NavLink>
```

The `activeClassName` prop assigns a class name to this element when it's path is the current path in the browser.

Set up your NavLinks with the activeClassName. Style this class name with your stylesheet. 

### Deliverable

Update the GitHub Repo for your portfolio project, then update the progress tracker to with a link to show that this Assignment has been completed. 

### Due date

Class 6

## Assessing the assignment

[Assignment 5 Rubric](./Assignment-05-rubric.md)


