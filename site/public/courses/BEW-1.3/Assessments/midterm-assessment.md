# Assessment 1 Study Guide

### Node & Express

- Write a route in Express to display plain text or JSON using `res.send`
- Render a Handlebars template using `res.render`
- Write a route that accepts data as a route variable, e.g. `/posts/1`, and use `req.params` to retrieve the data
- Write a route that accepts data as a query parameter, e.g. `/posts?id=1`, and use `req.body` to retrieve the data
- Use multiple Express routers to create nested routes
- Explain the purpose of middleware and give an example of Express middleware

### Handlebars

- Use `{{#each LIST_OF_ITEMS}}` and `{{/each}}` to loop over a list of items in a Handlebars template
- Use `{{#if CONDITION}}` and `{{/if}}` to conditionally display data in a Handlebars template

### Databases & Schema Design

- Write a Mongoose schema and model for a given scenario (e.g. create an `Event` class with 3 fields to represent an event)
- Write schema fields with various data types (string, int, boolean, Date, etc)
- Use queries such as `find`, `findOne`, `create`, `updateOne`, and `deleteOne` to CRUD objects in the database
- Use the `ref` field option to create relationships between models