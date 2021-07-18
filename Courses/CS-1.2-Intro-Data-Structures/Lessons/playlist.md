# Music Playlist 🎶


## Description

In this project, you will be building a music playlist builder using a linked list as the underlying data structure. Your playlist builder allows users to add new songs, remove songs, search for songs, and get the length of the playlist.

## Learning Outcomes
By completing this project, you should be able to…

- Create a linked list using an OOP approach
- Identify the main components of a linked list
- Read items in a linked list
- Update items in a linked list
- Search for items in a linked list


## Requirements

### Submission Requirements:
1. Your submitted code should be in a new (public) repo on Github.
1. Your repository should have a minimum of **5 commits**. 
1. Your repo should include a README with the name of your project and a description.
1. Create a demo video. The demo should include a walkthrough of your code and demonstration of your project working.
1. [Optional] Upload your video to Google Drive and share a link if Gradescope upload speeds are too slow.
1. Submit the link to your repo and demo on [Gradescope](https://www.gradescope.com/courses/202248/assignments/803584).

### Assignment Requirements:

Download the [starter code from here](https://github.com/Make-School-Courses/CS-1.2-Intro-Data-Structures/tree/master/src/PlaylistLinkedList-StarterCode), which includes:

1. `main.py`
1. `Playlist.py`
1. `Song.py`


Your goals are:

1. Complete the `TODO`s in `Song.py`:
  - Create a getter method for the `title` attribute, called `get_title()`
  - Create a setter method for the `title` attribute, called `set_title()`. Make sure titles are type cased to strings and are **Title Cased**.
  - Create a getter method for the `next_song` attribute, called `get_next_song()`
  - Create a setter method for the `next_song` attribute, called `set_next_song()`.  Make sure titles are type cased to strings and are Title Cased.
  - Using the `__str___()` dunder method, return a string of the song title.
  - Using the `__repr__()` dunder method, return a string formatted as the following:`'Song Title -> Next Song Title'`

2. Complete the `TODO`s in `Playlist.py`:
  - Create a method called `add_song()` that creates a `Song` object and adds it to the playlist. This method has one parameter called `title`.
  - Create a method called `find_song()` that searches for whether a song exists in the playlist and returns its index. The method has one parameter, `title`, which is the title of the song to be searched for. If the song is found, return its index. If not found, return `-1`.
  - Create a method called `remove_song()` that removes a song from the playlist. This method takes one parameter, `title`, which is the song that should be removed. 
  - Create a method called `length()`, which returns the number of songs in the playlist.
  - Create a method called `print_songs()` that prints a numbered list of the songs in the playlist.
  - Test your solution by running the code in `main.py` and test all of the 5 options.



### Stretch Challenges (Optional)
1. Add a `insert_song(title, index)` method to the Playlist class that creates a new song and adds it a specified index of the linked list.
1. Add a `shuffle()` method to the Playlist class that shuffles the order of the Songs in the playlist. After, add it to the options menu in main.py
1. Add a `reverse()` method that will reverse the linked list in place.


## Rubric

You can find the rubric for the Playlist project [here](https://docs.google.com/document/d/18EX0UCNB2AjkeLQ4JIh2JRq7vGynZpqk4EsJyAdgX9w/edit?usp=sharing)



