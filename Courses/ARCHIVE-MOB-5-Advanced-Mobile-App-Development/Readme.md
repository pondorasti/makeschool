# ARHIVE - Advanced iOS App Development

## NOTE: This repo is no longer maintained

## Course Overview

The goal of this class is to build a video Q&A app modeled after the Whale iOS App. We will focus on building only a subset of features of the Whale app, with a focus on **netwoking**, **architecture** and a bit of fun with video with **AVFoundation**. 

## Objectives

- Leverage advanced Swift features to architect your app
- Build common app features like networking, authentication, pagination

## Competencies

Students should be able to:

- Use AVFoundation to play, record and save videos & photos
- Build an iOS app from an API specification
- Implement pagination in their projects
- Implement authentication their projects



### Spec Project

Key features:
1. Download JSON, Images and Video and display them
2. Work with AVFoundation to play, edit and save video and images
3. Manage and use multiple dependencies in your project
4. Add pagination for a seamless user experience
5. Use multiple persistence technologies(Keychain, UserDefaults, CoreData) to save user data


## Course Schedule

- #### Week 1
    - [Project Overview](01-Assigned-Project)
    - [App Architecture](02-App-Architecture)
    - [Dependency Management](03-Dependency-Management)
 
- #### Week 2
    - [Distributing Information](05-Distributing-Information)
    - [Elegant Error Handling](00-Error-Handling)
    - [Networking Overview](06-Networking-Overview)
    
- #### Week 3
    - [Layout Essentials](07-Layout-Essentials)
    - [Working with AVFoundation - Playing videos](09-Working-with-AVFoundation-Playing-Videos)
    - [Generics - Functions, Protocols & Enums](08-Generics)

- #### Week 4
    - [Working with AVFoundation - Recording Video & Audio](10-Working-with-AVFoundation-Recording-Video-Audio)
    - [Working with AVFoundation - Editing Video & Audio](11-Working-with-AVFoundation-Editing-Video-Audio)
    
- #### Week 5
    - Project completion/ wrap-up
 
 ## Evaluations
 
To pass the course, students will have:

    1. Finished the baseline features of the project
    2. Attempted 20% of the optional features


 ## Resources
 ### API Endpoints

| Resource                | Endpoint                                                                     | Request Type | URL Parameters                    | Body                                                                                                            | Body Type       | Needs Authorization Header | Description                                                                                                  |
|-------------------------|------------------------------------------------------------------------------|--------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------|--------------------------------------------------------------------------------------------------------------|
| Get Users               | https://whale2-elixir.herokuapp.com/api/v1/users                             | GET          | per_page: Intpage: Int            | -                                                                                                               | JSON            | False                      | Fetches all Users                                                                                            |
| Create User             | https://whale2-elixir.herokuapp.com/api/v1/users                             | POST         | -                                 | email: String first_name: String last_name: String password: String username: String image_url: Optional - File | JSON/ Multipart | False                      | Creates a User. If the image_url is passed in with a file, the profile photo of the user is uploaded as well |
| Login User              | https://whale2-elixir.herokuapp.com/api/v1/sessions                          | POST         | email: String password: String | -                                                                                                               | -               | False                      | Login a User                                                                                                 |
| Get Answers             | https://whale2-elixir.herokuapp.com/api/v1/answers                           | GET          | per_page: Intpage: Int            | -                                                                                                               | -               | True                       | Fetches all Answers                                                                                          |
| Get Answer Comments     | https://whale2-elixir.herokuapp.com/api/v1/answers/**answer_id**/comments    | GET          | per_page: Intpage: Int            | -                                                                                                               | -               | True                       | Fetches all comments for an Answer                                                                           |
| Get Answer Likes        | https://whale2-elixir.herokuapp.com/api/v1/answers/**answer_id**/likes       | GET          | per_page: Intpage: Int            | -                                                                                                               | -               | True                       | Fetches all likes for an Answer                                                                              |
| Create/Upload an Answer | https://whale2-elixir.herokuapp.com/api/v1/questions/**question_id**/answers | POST         | -                                 | video: File thumbnail: File                                                                                     | Multipart       | True                       | Creates an Answer; uploads the answer video and thumbnail                                                    |
| Get My Questions        | https://whale2-elixir.herokuapp.com/api/v1/questions                         | GET          | per_page: Intpage: Int            | -                                                                                                               | -               | True                       | Fetches all questions for a logged in User                                                                   |
| Create Question         | https://whale2-elixir.herokuapp.com/api/v1/questions                         | POST         | -                                 | receiver_id: Intcontent: String                                                                                 | JSON            | True                       | Creates a question for a User(receiver)                                                                      |


### Sample PAW & Postman files (Right-click and save)
Paw File - [Link](Whale.paw)

Postman File [Link](Whale.postman_collection.json)

### Icon set
Icons - [Link](Icons.zip)
