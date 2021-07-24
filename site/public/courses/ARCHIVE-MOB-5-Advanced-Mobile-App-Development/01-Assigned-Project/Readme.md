# Whale Project Overview

The goal of this project is to introduce you to common concepts in iOS development.

For the assigned project we will only provide you with the requirements for the application (spec, mockups, etc.) but we won't provide a guided tutorial to implement it. By figuring out the implementation on your own (with guidance from instructors) you will learn a lot!

Throughout the weeks, we will provide you will lectures that will introduce you to the tools, concepts and technologies needed to complete the assigned project.

# Project Outline

The Whale iOS App is a video Q&A app.
- Common terms:
    - **User** - A User of the whale app.
    
    - **Question** - A User can ask any other User a question. A question is just text.
        - **(Question) Sender** - The user who asked the question.
        - **(Question) Receiver** - The user receiving the question.
        
    - **Answer**: An Answer is a response to a question An answer is made up of:
        - Video - The video of the Answer
        - Thumbnail - An image preview of the Answer
        - Question - The question that led to the Answer
        - LikeCount - The count of likes on an Answer
        - CommentCount - The count of comments on an Answer

## User Story
#### Authentication
A User logs in with an email and password. A user can also sign up if User does not have an account.

#### Main View
There should be 3 tabs - a tab for Answers, Activity and Profile

- #### Answer Tab
The User presented with a paginated list of Answers. 
The each Answer in the list shows a thumbnail preview of the video. 
When a user taps an Answer, a new screen is presented that plays the Answer's video. 
 - Video Player Scene - The video automatically plays and a User can pause and play the video. There is a progress indicator for the video which displays the current time of the video
Underneath the video is the user who asked the question (sender), the question, and a count of the likes and comments of an answer.
There is a view comments button, when pressed, it presents a view containing a paginated list of comments.
A user can post a comment from the comments view.

- #### Activity Tab
A User is presented with a list of pending(unanswered) questions. Displayed is the question sender, the question and a button to answer the question.
When the answer button is pressed, a screen is presented to record a video.
    - Video Recorder/Editor Scene - Records a series of videos, (less than 2 mins total). When the video is recorded, another screen is presented to upload the video to the server.
    - Video Upload screen - Merges the video segments into one video, takes a thumbnail photo for any one of the segments or the merged video and uploads it to the server.
Display an error or success message when the upload button is pressed

- #### Profile Tab
Displays the current logged in user's profile image, full name, follower and following count and about.

### Optional Features
- [x] Answer a question with segmented videos then merge videos when completed editing
- [x] Use Core Data to store User profile and sync with server. On the user profile tab, the user is fetched from Core Data, when a refresh is preformed, synchronize the data with the server
- [x] Create another tab, called Search and allow a User to search users from the server. Then display their profile when clicked. Allow a User to follow or unfollow a searched User.

## Screen Layout
![Screens](app-flow.png)


## API Endpoints

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


# Next - [Project Setup](whale-folder-structure.md)