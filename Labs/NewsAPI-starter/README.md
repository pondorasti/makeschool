# NewsAPI-starter


CODING EXERCISE:<br>
You assignment is to complete the starter app <insert starter app URL here> by inserting completing the code for the HTTP request to a web service API and by refactoring all model-related code in a manner that illustrates your current understanding of sound iOS design patterns and principles.

This assignment is in 4 parts.

Required Recourses:<br>
The starter app <insert starter app URL here>, which includes a pre-built table view ready to present the results of your data fetch code.
Web Service API: https://newsapi.org<br>
Target Endpoint: Sources

Here is what your final URL will look like:<br>
https://newsapi.org/v1/sources

TIPS:<br>
Try this URL in a browser to become familiar with the nature of the JSON data returned.<br>
You may also want to refer to the Photomatic app used in Lessons 8 and 9 for clues on how to execute this assignment.<br>
Pay rapt attention to any and all //TODO: annotations in the code. They are there to guide you in your work.<br>

Part 1: Build the URL<br> 
This time, you will need to build out the URL from separate URLComponent properties, including:<br>
.scheme<br>
.host<br>
.path<br>
	
Part 2: HTTP Request<br>
Create and send an HTTP GET request to the target endpoint by inserting the required code in the functions provided.

Part 3: Convert JSON<br>
After your HTTP request is successful, you will need to decode the JSON returned so that it can be presented in the table view.

Part 4: Refactor<br>
Applying your knowledge of the principle of Separation of Concerns, refactor all model-related functions and data containers into files and other constructs which better exemplify the MVC design pattern.


