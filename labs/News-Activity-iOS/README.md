# MOB1.3_Final_Exam_app

## MOB 1.3 Final Exam Coding Steps

### CODING EXERCISE:
You assignment is to complete this starter app by completing the code for the HTTP request to a web service API and by refactoring all model-related code in a manner that illustrates your current understanding of sound iOS design patterns and principles.


### Required Resources:

1. This starter app, which includes a pre-built table view ready to present the results of your data fetch code.
2. Web Service API : https://newsapi.org (NOTE: use version 1)
3. Target Endpoint: sources

Here is what your final URL will look like:
https://newsapi.org/v1/sources

**TIPS:** 
* Try this URL in a browser to become familiar with the nature of the JSON data returned.
* You may also want to refer to the Photomatic app used in Lessons 8 and 9 for clues on how to execute this assignment.
* Pay rapt attention to any and all *//TODO:* annotations in the code. They are there to guide you in your work.
* Best strategy: This assignment is in 4 parts. Complete each of the parts 1-4 in order.


**Part 1: Build the URL**
This time, you will need to build out the URL from separate URLComponent properties, including:
.scheme
.host
.path

**Part 2: Create and send an HTTP Request**
Create and send an HTTP GET request to the target endpoint by inserting the required code in the functions provided.

**Part 3: Convert JSON**
After your HTTP request is successful, you will need to decode the JSON returned so that it can be presented in the table view.

**Part 4: Refactor into a Networking Layer**
Applying your knowledge of the principle of Separation of Concerns, refactor all model-related functions and data containers into files and other constructs which better exemplify the MVC design pattern.


