# Pokemon API

Resources needed:
* [The Pokemon API](https://pokeapi.co)


## PART 1

- Create and call a function that fetches data from the Pokemon API to fetch a list of Pokemon. This is the endpoint: `/pokemon`
- In your data tasks' completion handler, **convert** the returned `data` object to JSON, and **print** your converted `jsonObject` to the debug console.
- Use a Pokemon struct that conforms to the Codable protocol (it will only have two properties at this point: name and url)
- Handle the HTTP `error` object returned and any other validation you want to include (status, data, etc.)

## PART 2

Create a **table view** that supports **pagination**:
- Uses a cell to present the name of the Pokemon from the JSON response returned
- When scrolled to the end of the currently available data, the app must fetch new data to enable pagination.
- Check the section "Resource lists and pagination" straight from the docs: https://pokeapi.co/docs/v2.html/
In the end you will have a table view that keeps on getting new data for Pokemon as you reach the end of the scroll.

## PART 3

- Besides just showing the name of the Pokemon, include their picture in the cell.
- Use this library to load pictures: [Kingfisher](https://github.com/onevcat/Kingfisher)

## Example implementations

- [Example 1](https://github.com/caocmai/mob1.3-fetching-from-api)

- Example with images in table view

![demo](pokemondemo.gif)

## Inspiration: Sample projects using the Pokemon API

- [Sample 1](https://github.com/tron1991/Pokemon-API-Swift)
- [Sample 2](https://github.com/Frog-Frog/Pokedex)


#### Alternative API: https://swapi.dev

If you don't feel like fetching Pokemon, use the Star Wars API.

- Using the /people/ endpoint
- Use a cell to present the "name" and 1 other property/items (i.e.. "height") from the JSON response returned
