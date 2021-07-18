# React Router Challenge! 

This project has several components that mock up a ficticious busniess. Everything is currently displayed on one page. Your job is to split everything up into mulitple pages using React Router. 

Currently the site contains the following components: 

- `Header`
- `ProductsAll`
- `PageAbout`
- `PageContact`
- `ProductDetail`
- `Footer`

These are all standard React components. 

You can divide these into # categories

- **Fixed** - They always appear on the screen
  - `Header`
  - `Footer`
- **Static** - They display static content, that is the content is always the same and stored inside the component. 
  - `ProductsAll` 
  - `PageAbout`
  - `PageContact`
- **Dynamic** - The content displayed by this component is passed into the component via props. 
  - `ProductDetail`

You can preview all of these components by running the default app. 

## Challenges 

**Challenge 1** Install React Router

You'll use React Router to manage navigation. 

`npm install react-router-dom`

**Challenge 2** Setup router

Import `HashRouter` and create a top level router. 

`App` is the top level component. Place your Router here and make it the top level component. 

`import { HashRouter as Router } from 'react-router-dom'` 

Surround the contents of App with a Router. 

```jsx
function App() {
  return (
    <Router>
      <div className="App">
        
      </div>
    </Router>
  );
}
```

**Challenge 3** Define some fixed content. This is content that will appear on all pages. Fixed content for this example is: 

- `Header`
- `Footer`

```jsx
function App() {
  return (
    <Router>
      <div className="App">
        <Header />
        
        <Footer />
      </div>
    </Router>
  );
}
```

**Challenge 4** Define some Links. These will be used navigate between components/Pages. 

The Links are in Header. Since this is toplevel navigation that appears on all pages you'll use the `NavLink` component from React Router Dom. 


Import `NavLink` at the top of `Header.js`

```jsx
import { NavLink } from 'react-router-dom'
```

Currently there are `<a>` tags used. Replace these with `<NavLink>`s. You'll need to define a path for each of these routes. Paths can be the names of the pages: 

- '/' - Home Page: displays `ProductsAll`
- '/about' - About Page: displays `PageAbout`
- '/contact' - Contact Page: displays `PageContact`

Set the `to` attribute of each `NavLink` to the paths above. For example: 

`<NavLink to='/'>Home</NavLink>`

_This will NOT create navigation yet._ You'll have to define a `Route` to handle each of these paths. 



**Challenge 5** Defining `Route`s for each of the paths. Each `Route` will render a component when the path matches the path defined in the `Route`. 

In this case you want to render `ProductsAll`, `PageAbout`, and `PageContact` for the paths you defined in the links above. 

Every `Route` has a component that it renders and it will render that component where `Route` is placed in your code. 

You want the `Route`s to be displayed between `Header` and `Footer` in `App`. 

In `App.js` import `Route` from React Router Dom. 

```js
`import { HashRouter as Router, Route } from 'react-router-dom'` 
```

_Note: `Router` and `Route` are different components with different purposes with only one letter difference in their names. 

Next define three `Route`s in the `App` component. These will go between `Header` and `Footer` because that's where you want the route to display your components. 

```jsx
function App() {
  return (
    <Router>
      <div className="App">
        <Header />

        <Route path="/" exact component={ProductsAll} />
        <Route path="/about" component={PageAbout} />
        <Route path="/contact" component={ProductsContact} />
        
        <Footer />
      </div>
    </Router>
  );
}
```

Notice, each  `Route` has a `path` and `component` prop. The path needs to match the path defined by the link for the link to display the component. 

Notice the first path includes `exact`. This is needed since this path '/' shares a similar spelling to the others (they all begin with '/') Without `exact` here the `ProductsAll` component would be displayed with the other two routes. By including `exact` you're telling router it should only display this route when the path matches _exactly._

**Challenge 6** The Product detail component displays data dynamically. This is a single component that can display any of the products in the mock data. 

There are a few ways to handle this. For this example you'll handle dynamic data by passing the data through a Link. 

Each of the products is displayed by the `Product` component. This component receives all of the data for any product in  `props`. You're goal is to pass these props to a link that will display `Route`. 

Define a `Route` in `App.js`. Import the `ProductDetail` component

`import ProductDetail from './ProductDetail`

Then define a new `Route` in App.js:

```jsx
function App() {
  return (
    <Router>
      <div className="App">
        <Header />
        ...
        <Route path="/product-detail" component={ProductDetail} />
        ...
        <Footer />
      </div>
    </Router>
  );
}
```

In the `Product` define a `Link` that will be used to show this new `Route`. 

In `Product` import `Link`

`import { Link } from 'react-router-dom'`

Then wrap the `img` in the `Link`. This way clicking the image will navigate to the new route.  Do this in Product.js:

```jsx
function Product(props) {
  return (
    <div className="Product" style={{}}>
      <h3>{props.name}</h3>
      <Link
        to={{
          pathname:'/product-detail',
          state: props
        }}
      >
        <img src={props.image} />
      </Link>
    </div>
  );
}
```

Here the `to` prop is an object with a `pathname` and `state`. The `pathname` prop defines the path for the route. The `state` prop is a value that can be passed along to the component rendered at this route. 

Handle the dynamic data passed along to `ProductDetail`. Make the following changes. 

```jsx
function ProductDetail(props) {
  const { name, desc, image_lg, price } = props.location.state
  return (
    ...
  );
}
```
