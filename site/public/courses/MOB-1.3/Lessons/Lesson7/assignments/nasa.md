# NASA's picture of the day 🪐

For this exercise we will use these 3 resources:
1.  httpbin.org's [public API tester](https://httpbin.org/#/Request_inspection/get_headers)
2. Nasa's public [Astronomy Picture of the Day API](https://api.nasa.gov)
3. The [DailyPlanet](https://github.com/VanderDev1/DailyPlanet) starter app

**Part 1 - Individual**

Using the `Request inspection` endpoint on httpbin.org's tester page, we will send a `GET /headers` *request* that will return the `request's HTTP headers` in its `Response body`.

![syntax](request_inspection_endpoint.png) </br>


1. First, examine httpbin.org's exceptional, easy-to-use [web service testing interface](https://httpbin.org) in a web browser on your laptop.
2. Next, expand the *Request inspection* dropdown and its *GET /headers* function. Press the `Try it out` and `Execute` buttons. In the *Responses* fields returned, pay particular attention to the `"headers":` node in the *Response body* field. Also notice the HTTP status code returned (success = 200).

*(Feel free to experiment a little with this interface when you have time.)*


**Part 2 - Individual**

1. Download and run the [DailyPlanet starter app](https://github.com/VanderDev1/DailyPlanet). *(Don't worry if the main scene is a blank screen - we'll improve on that later!)* </br>
2. Study the construction of its `fetchHeaderData()` function.</br>
3. Compare your debug output with the results of same *GET /headers* request executed from your web browser.

<!-- Add graphic and/o code samples -->


**Part 3 - Individual**

**TODO:** Using the URLSession implementation steps covered so far, complete the implementation of the `fetchNasaDailyImage()` in the starter app and present Nasa's Astronomy Picture of the Day to your users.

**NOTES:**
1. At the time of this writing, NASA's pic of the day was:
https://apod.nasa.gov/apod/image/1902/FoxFur_new_color_2048px.jpg

2. To get the latest pic of the day:
- Launch the demo URL in your browser -- this will only return **metadata** for NASA's pic of the day:
https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY
- in the metadata returned, find the `hdurl` node and copy it into your iOS project

*For clues, see the URLSession implementation details of the `fetchHeaderData()` function.*

**Part 4 - As A Class**

  Briefly discuss..

**Q:** What is the essential nature (data type) of each of the 3 objects returned when the `completion handler` executes?

- the `response` object?
- the `data` object?
- the `error` object?

**Q:** Why was the `DispatchQueue.main.async` statement needed?

``` Swift
    if let data = data, let image = UIImage(data: data) {
                 DispatchQueue.main.async {

                       //TODO: Insert downloaded image into imageView
                 }
```
