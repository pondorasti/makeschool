package urlshort

import (
	// TODO: Step 1 - Uncomment this...
	// "encoding/json"
	"net/http"
)

type pathToURL struct {
	Path string
	URL  string
}

// MapHandler will return an http.HandlerFunc (which also
// implements http.Handler) that will attempt to map any
// paths (keys in the map) to their corresponding URL (values
// that each key in the map points to, in string format).
// If the path is not provided in the map, then the fallback
// http.Handler will be called instead.
func MapHandler(pathsToUrls map[string]string, fallback http.Handler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		originalURL, ok := pathsToUrls[r.URL.Path]
		if ok {
			http.Redirect(w, r, originalURL, 301)
		} else {
			fallback.ServeHTTP(w, r)
		}
	}
}

// JSONHandler will parse the provided JSON and then return
// an http.HandlerFunc (which also implements http.Handler)
// that will attempt to map any paths to their corresponding
// URL. If the path is not provided in the JSON, then the
// fallback http.Handler will be called instead.
//
// JSON is expected to be in the format:
//
//     [
//	     {
//         "path": "/some-path",
//         "url": "https://www.some-url.com/demo"
//       }
//	   ]
//
// The only errors that can be returned all related to having
// invalid JSON data.
// func JSONHandler(jsonData []byte, fallback http.Handler) (jsonHandler http.HandlerFunc, err error) {
// 	// TODO: Step 2 - Implement this...
// 	return
// }
