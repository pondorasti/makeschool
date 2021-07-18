# Web 6 React product list challenge

The goal is to list products and their categories. 
Use the supplied data files supplied. These files 
simulate data that you might get from an web API. 

## Import data

`inventory.js` exports inventory as default. This is
an array of objects. 

Each object looks like this:

```json
{
  "id":2,
  "name":"Trippledex",
  "description":"Ergonomic stable pricing structure",
  "price":"$8.45",
  "category":"Health"
}
```

`inventory.js` also exports a list of categories 
that appear in products. This is an array of Strings.

```JavaScript
["Home", "Beauty", "Food", "Animals", ... ]
```

You can use the ES6 Syntax:

`import inventory, { categories } from './inventory'`

## Components 

Think about the component structure you will use. 

My test project looked like this: 

![Example](Screen-Shot.png)

At the top there is a list of categories. Below is a 
list of products. 

Clicking a category filters the products list to show
only products in that category. 

You should break down everything into components.  

### Challenges. 

1. Display a list of categories
2. Display the list of products
3. Clicking a category filters the products to only that category
4. Add a button to display all categories to the category list
5. Add styles. 
  - Style the category links
  - Style the currently selected category link
  - Use Flex box to arrange the category links
  - Use CSS grid to arrange the products list
