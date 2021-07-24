# Passwords Project

This project will be built in React or React Native. The premise of the 
project is a utility that generates passwords and stores them. 

# Intro

People often have many passwords to remember, and are often required 
to make up new passwords. Weak passwords are the bane of modern life. 
A utility that can generate and store passwords might be useful. 

Imagine this project as a utility application that can do the following: 

- Generate a random password using several methods.
- Save a list of passwords with some notes. 
- Edit and Delete passwords that have been created.

## Discussion

Before building a new project it is always a good idea to examine it's 
features. 

- What makes a safe password? 
- What different types of passwords can be generated?
- Is this a viable product? 
  - What are the risks and security issues? 
  - How does JS and the browser as a platform affect this product? 
- Should a password app be password protected?
  
## Specifications

This project can be built with React or React Native. It must use Redux. 

The App must be able to generate new passwords using at least two 
different algorithms. 

The app must be able to create new passwords and save them with a name 
and a short description. 

The must show a list of passwords, show details for a password, edit and
delete existing password entries. 

- Built with React/Native
- Uses Redux
- Persists password data 
- Creates password entries with name and description
  - Can edit and delete existing passwords
- Displays a list of passwords
  - Displays a details for a password
- Can generate passwords with two or more algorithms

![https://xkcd.com/936/](https://xkcd.com/936/)
  
## Technical Discussion 

- What does the project need to display?
  - How should it display a password? 
- What views will you need? 
- What should be a component? 
- What about Redux, how should the store be structured?
- What are good algorithms for creating random passwords? 
  - Random characters
  - Random words
  - Haiku

## Notes 

For security reasons this project would proabably be best implemented with React Native.

This project will work with `localStorage`. Data and functionality will be encompassed within 
the app, there is no network component. 

The app itself might use a password for access to the password list. 

You'll probably want to use a scrollview or a listview to display passwords. 

You'll probably want to use react navigation to manage 'screens' displaying 
the list of passwords, password details, and a form for creating new password 
enteries. 

### Strategies 

This project will need to save information locally. JavaScript provides `localStorage` as a 
solution. React Native has a native implementation of `localStorage`.

The project will need to navigate across multiple pages. For this you can use React Router. 

Application data needs to be reflected and shared across all pages of the app. For this you can 
use Redux. 

Application data managed by Redux will need to be backed and synched with localStorage. There
are several solutions. The example uses: https://www.npmjs.com/package/redux-localstorage-simple

https://www.pcworld.com/article/2978316/security/tired-of-memorizing-passwords-a-turing-award-winner-came-up-with-this-algorithmic-trick.html
