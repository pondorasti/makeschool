

# React Router

Routing is the concept of navigating through pages of content and connecting the change in content to the URL in the address bar. 

This example covers using React Router a library of Components that facilitates routing. 

## Learning Objectives

1. Identify navigation 
  - Components that divide a page into content elements
  - Paths to define routes
1. Use React Router with a React
  - Define Component to be handled with Routes
  - Define Links to display Routes
1. Identify Static and Dynamic Content

## Basic Routing

Single page applications are just that: a single HTML page/document. Normally you are linking to different documents using the anchor tag `<a>`. 

In a single page application you can't leave the current document. Instead you need to change the content that is displayed by modifying the DOM. In React this is handled this by managing which components are rendered. React Router is a library made for just this purpose. 

Reat Router is a library of React Components. You'll import and use these components to manage the components you create. 

### Set up React Router

Setup the demo project and create simple routes.

- Create a new React project
  - `npx create-react-app react-router-example`
- Navigate to the project 
  - `cd react-router-example`
- Install dependencies
  - `npm install react-router-dom`
- Start the project 
  - `npm start` or `yarn start`

### Using `HashRouter`, `Route`, `NavLink`, and `Link`

Use the `HashRouter`, `Route`, and `Link` components to "navigate" between components. Really what's happening is the _conditional rendering_ of components. 

Use `HashRouter` at the top level to manage routing. Think of this as the container within which all of your navigation happens. All of your Routes and Links must be children of your Router. Make sure HashRouter is at the top level of your App. 

```jsx
<HashRouter>
  ...
</HashRouter>
```

Use `NavLink` to trigger navigation. This like an anchor tag. NavLink uses a `to` attribute to name a path. 

`<NavLink to="/">Home</NavLink>`

This link will display the text "Home". When clicked it will set the address in browser URL to "/". 

Use `Route` to define a route to display component. A route includes a `path` and `component` props. When the URL in the browser matches the path the `component` is rendered.

`<Route path="/" component={HomePage} />`

Displays the HomePage component when the path shown in the browser url is "/".

### Types of Routers

React Router provides several different Routers. 

- BrowserRouter
- HashRouter
- and more...

I'm using HashRouter for these examples becuase it works eith GitHub Pages. I'm going to have you publish this project to GitHub Pages so using HashRouter now will ensure compatibility. 

### `props.match`

`HashRouter` supplies all child components with a prop called `match`. This prop contains information about the current route including: 

- params
- isExact
- path
- url

See the example on nested routes for examples of `match` in use. 

### Link 

Use `<Link>` to display a route. Use the `to` prop/attribute to define the route. A route is a relative URL that will navigate to a matching route. 

`<Link to="/">Home</Link>`

### Route 

A `<Route>` is responsible for displaying a component when it's path matches the current address. There three important props/attributes. 

- `path` defines the URL that will display this route
- `component` defines the component that will be displayed by this route
- `exact` if included the route must be an exact match. For example "/" is a match for "/about" and "/sales" it is an exact match only for "/"

`<Route path="/" exact component={Index} />`

**Note**: If you need to configure a component for a route use this syntax:

`<Route path="/" exact render={() => <Index title={title} />} />`

In this example we're passing a function to the `render` prop and that function is returning a component. 

Alternately you can pass "state" to a Route/Component from a link using this syntax:

```jsx
<Link 
  to={{
    pathname:"/details",
    state: props // Pass props through Link
  }}
>
```

In the example above `props` could be any JS object holding properties that you wish to pass to the component displayed at the "/details" route. 

### Nested Routes 

A nested Route is a route that displays inside another Route. 

Use a path that shares the parent path and _don't use exact_. 

You can guarantee that path matches by getting the current path with `match.url`. 

The Link to a nested Route might look like: 

`<Link to={`${match.url}/project-1`}>Project 1</Link>`

The Route might look like: 

`<Route path={`${match.url}/:projectName`} component={Project} />`

Here `/:projectName` is a param that can be accessed by the Route. Inside the Route, you could access this param with: `match.params.projectName`.

1. https://github.com/ReactTraining/react-router
2. https://reacttraining.com/react-router/web/guides/quick-start