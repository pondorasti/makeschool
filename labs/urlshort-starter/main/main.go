package main

import (
	"fmt"
	"net/http"

	"urlshort"
)

func main() {
	// Create a new server instance.
	mux := defaultMux()

	// Build the MapHandler using the mux as the fallback.
	pathsToUrls := map[string]string{
		"/make-school": "https://www.makeschool.com",
		"/bew2.5":      "https://make-school-courses.github.io/BEW-2.5-Strongly-Typed-Ecosystems",
	}
	mapHandler := urlshort.MapHandler(pathsToUrls, mux)

	// TODO: Step 3 - Build the JSONHandler using the mapHandler as the fallback in the space below:
	//
	//
	//

	// TODO: Step 4 - Change this line to serve the jsonHandler you instantiated in Step 3.
	http.ListenAndServe(":8080", mapHandler)
}

func defaultMux() *http.ServeMux {
	mux := http.NewServeMux()
	mux.HandleFunc("/", hello)
	return mux
}

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world!")
}
