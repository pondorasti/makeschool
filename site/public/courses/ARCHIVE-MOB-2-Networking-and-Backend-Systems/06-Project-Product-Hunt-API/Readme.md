# Project - Product Hunt API

A client wants to build a simple wrapper around Product Hunt using the PH API. The first feature the client wants you to implement is a feed that displays all of today's featured products. The client wants to keep the project lean and asks you explicitly not to use any dependencies or third party libraries.

## Spec

- [x] Create your URL in a composable manner so the client can easily add more features reusing base URL and/or adding more parameters to existing URLs.

- [x] Make a networking request to fetch all of the products featured today on PH.

- [x] Convert the data returned into Swift models.

- [x] Display the data returned in a feed(UITableView) that shows each product's name, tagline, number of votes. Optionallay you can show the thumbnail image.

- [x] If a user clicks on a post, show a new screen with all the comments for that post, sorted in descending order.

- [x] After you've completed steps 1-5, go back and refactor your code so that you're constructing URL requests with an enum.

**Resources:**
https://api.producthunt.com/v1/docs/

You will need to sign up for Product Hunt, register an application, and generate a token.

Example:

Name: PHAPIExampleApp

Redirect URI: http://localhost:3000/users/auth/producthunt/callback
