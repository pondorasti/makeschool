# Geolocation

The geolocation API allows your web apps to get your position in the world. 

The `navigator.geolocation()` gets your location from the browser. It uses callbacks!

```JS
navigator.geolocation(success, error, options)
```

- `success` - on success callback. This callback receives a position object
- `error` - on error callback. This callback receives an error object. 
- `options` - an object with options that configure the operation. 

Look at the example code and test it. 

Read up on `navigator.geolocation.getCurrentPosition()`: https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/getCurrentPosition

**Important!** The geolocation api only works with an HTTPS connection. If you run this locally from the desktop or with liveserver it will be run on an HTTP connection and will throw an error! 

You can solve this by running it in your React project. Follow the instructions in the video tutorials about running the Create React App project with HTTPS. 

**Challenge!** This implementation is awkward! It would be better handled with a Promise! 

Your goal is write a function that returns a Promise! You should be able to call it like this: 

```JS
getGeolocation(options).then().catch()
```

The `onsuccess` should be handled by resolve and the `onerror` should be handled by reject. If you resolve you'll receive a position object which will be received by the `.then()` callback. 
