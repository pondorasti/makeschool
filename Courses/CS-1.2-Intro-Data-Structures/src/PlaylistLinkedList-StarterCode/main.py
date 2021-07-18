from Playlist import Playlist

playlist = Playlist()

while True:

  # Prints welcome message and options menu
  print('''

  Welcome to Playlist Maker 🎶  

  =====================================
  Options:
  1: View playlist
  2: To add a new song to playlist
  3: To remove a song from playlist
  4: To search for song in playlist
  5: Return the length of the playlist
  =====================================

  ''')

  # Prints welcome message and options menu
  user_selection = int(input('Enter one of the 5 options:  '))

  # Option 1: View playlist
  if user_selection == 1:
    playlist.print_songs()


  # Option 2: To add a new song to playlist
  elif user_selection == 2:
    song_title = input('What song do you want to add? ')
    playlist.add_song(song_title)



  # Option 3: To remove a song from playlist
  elif user_selection == 3:
    song_title = input('What song do you want to remove? ')
    playlist.remove_song(song_title)


  # Option 4: To search for song in playlist
  elif user_selection == 4:

    song_title = input('Which song do you want to find? ')
    index = playlist.find_song(song_title)
    
    if index == -1:
      print(f"The song {song_title} is not in the set list.")
    else:
      print(f"The song {song_title} is song number {index+1}")


  # Option 5: Return the length of the playlist
  elif user_selection == 5:
    print(f"This set list has {playlist.length()} songs.")

  # Message for invalid input
  else:
    print('That is not a valid option. Try again.\n')

