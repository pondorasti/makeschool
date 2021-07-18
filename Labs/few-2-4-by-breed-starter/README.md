# By Breed Dataset

This repo contains a data set of cat and dog breeds. 

## Overview 

Mobile screens are small and have limited space. The default mode to view content it scrolling lists. 

The FlatList is a simple list that displays data is cells. 

Steve Jobs famously made the claim that you could have 10,000 songs on your iPod/iPhone. This would crash your device if you displayed all of the data at once. The FlatList instead only displays the data that is visible. 

It creates a number of cells that can be displayed on the screen. As these cells scroll, the cells are repopulated with new data and recycled. 

Imagine a list of songs in your phone. As the song on the top moves up past the top of the screen it is moved to the bottom and text labels and images in the cell are repopulated swith new song names and images.  

The example project contains some data for dogs and cats by breed. The data lists values from 0 to 5 on the animal's friendliness, intelligence, playfulness, etc. 

All of this data is in `cat-and-dog-breeds.json`. The data here is in a giant object, `breed.js` takes the data and organizes it into arrays. You can import the following arrays from `breed.js`:

- petTypes - Lists the types
- cats - Lists all of the cats each an object with features
- dogs - lists all of the dogs each and object with features

Note! Not all cats or dogs have the same feature properties. Many are shared but all properties do not exist on all animals.