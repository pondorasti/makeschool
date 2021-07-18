# Final Exam Practice - URL Shortener

## Goal

The goal of this exercise is to create an [http.Handler](https://golang.org/pkg/net/http/#Handler) that will look at the path of any incoming web request and determine if it should redirect the user to a new page, much like URL shortener would.

For instance, if we have a redirect setup for `/dogs` to `https://www.somesite.com/a-story-about-dogs` we would look for any incoming web requests with the path `/dogs` and redirect them.

## Instructions

To complete this exercise, you will need to implement the stubbed out methods in [`handler.go`](handler.go). Each method has lots of comments explaining what it should do, and there is also a [`main/main.go`](main/main.go) source file that uses the package to help you test your code and get an idea of what your program should be doing.

I suggest first commenting out all of the code in `main.go` related to the `JSONHandler` function and focusing on implementing the `MapHandler` function first.

After you get the JSON parsing down, try to convert the data into a map and then use the MapHandler to finish the JSONHandler implementation.

An example implementation may end up looking like this:

```golang
func JSONHandler(json []byte, fallback http.Handler) (http.HandlerFunc, error) {
  parsedJson, err := parseYAML(json)
  if err != nil {
    return nil, err
  }
  pathMap := buildMap(parsedJson)
  return MapHandler(pathMap, fallback), nil
}
```

In order for this to work, you will need to create functions like `parseJson` and `buildMap` on your own.

## Documentation

- [**Go By Example: Maps](https://gobyexample.com/maps)
- [**Go By Example: JSON**](https://gobyexample.com/json) - Review how to marshal and unmarshal JSON objects.
