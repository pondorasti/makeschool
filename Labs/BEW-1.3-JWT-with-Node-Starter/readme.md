# Instructions for using JWT with Node.js

### At the end of this activity you should successfully create a token, verify the token so that you can login and also access the protected route on the [home page](http://localhost:3000).

In this exercise you are to:

1. Clone this repository then run **`npm install`** to install the necessary packages\.
2. Install **`jsonwebtoken`** from NPM **`npm install -S jsonwentoken`** and load it by requiring on line 11\.
3. Create a **`.env`** file and include the values for port and private key. Check the **`.env-sample`** file for refrence. You can use any string as your private key and an available port value for your port number\.
4. Declare a const variable called payload on **line 43** and set it to the username of the user details on **line 37**. For example:  `const payload = {username: user.username}`\.
5. Create a token on **line 46** with the `jwt.sign()` function. See example for reference [here](https://github.com/Make-School-Courses/BEW-1.3-Server-Side-Architectures-and-Frameworks/tree/master/Lessons/07-Authentication):

    - pass the payload as its first argument.
    - pass the private key you set in task 1 above as its second argument
    - finally, set the last argument as an option for this token to expire in ***two(2) days***\.

6. Using `jwt.verify()`, complete the middleware function `checkAuth` on line 53 - to verify that the user is logged in with the token you have just created:

    - pass the token as its first argument
    - Verify the token, then call next() function when it's done\.
7. Start the server by running `npm start` in you terminal (make sure you are in the right directory on your terminal)\.
8. Go to your browser and visit `http://localhost:3000`, click on the log in button. You should be redirected to a page that says `You are logged in`\.
9. Try out the protected route in your browser `http://localhost:3000/protectedRoute`. Are you able to access it now?\.
