# API Testing Challenges

Clone this repository, then run `npm install` to install all necessary packages.

Complete all TODOs in `src/routes/message.js` and `src/test/message.js`. Then, run your tests to ensure that they pass.

Submit your code using [Gradescope](https://gradescope.com).

## Endpoints:

#### Messages (TODOs)

| Route | Method | Description |
| ----------- | ----------- | ----------- |
|http://localhost:3000/messages |GET | Gets all messagess |
|http://localhost:3000/messages/{messageId} |GET | Get one message by id|
|http://localhost:3000/messages | POST | add a new message |
|http://localhost:3000/messages/{messageId}| PUT | update an exisiting message|
|http://localhost:3000/messages/{messageId} | DELETE | delete a message |

{messageId} = Route parameter = `:messageId`
#### Users

| Route | Method  | Description |
| ----------- | ----------- | ----------- |
|http://localhost:3000/users/ | GET | get all users |
|http://localhost:3000/users/{userId} |GET | Get one user by id|
|http://localhost:3000/users | POST | add a new user to the database |
|http://localhost:3000/users/{userId}| PUT | update an exisiting user|
|http://localhost:3000/users/{userId} | DELETE | delete a user |

{userId} = Route parameter = `:userId`