# Music Player App

## Introduction

So far in your journey as an iOS developer, you've learned how to: build responsive UI, structure an app using MVC, persist data locally and remotely, interact with a backend service and used a variety of APIs available by Apple.

There are still many other topics you can explore, but with what you know today, you are able to build apps for any domain you can think of.

This project will combine your current expertise with the content from MOB 2.3 are able to build an app that's responsive and optimizes resources.

## Learning Outcomes

By the end of this project, you should be able to...

1. Build a functional app that satisfies the requirements listed below.
1. Implement common practices to aid with concurrency and persistence in an iOS app.
1. Use GCD and/or Operations to work with the main and background threads.
1. Use Xcode's Time Profiler to check the performance of your app.
1. Be capable of explaining your coding decisions.

## Description

Your task is to create an app that let's users discover new music. The app will also let users preview songs and save them as favorite songs.

- There's a login page to authenticate the user with Spotify's API/SDK
- The home page should display new releases (albums).
- When you tap on an album, you will go to another view controller to view the tracks.
- Users can listen to a preview of the songs.
- Users can also save songs by marking them as favorite.
- There's another view controller to list all of your favorite songs. You can preview the song from this VC too.
- Optionally, add a VC for an artist's info and top tracks.

Check the resources for helpful documentation!


## Wireframes

![wireframe](wire.jpeg)

## Requirements

1. Adhere to the description.
1. You must use the [Spotify API](https://developer.spotify.com/documentation/web-api/) or [Spotify SDK](https://developer.spotify.com/documentation/ios/)
1. Allow for the tracks to be previewed (30-sec clips)
1. Use a persistence method to save the favorite tracks, up to your criteria which one to use.
1. Use GCD and/or Operations to handle concurrency.
1. Authenticate users with the Spotify API/SDK - should also be able to log out
1. Time profile your app and show evidence of it.

## Stretch challenges

1. Add favorite songs directly to a user's playlist in Spotify
1. Create  a VC for an artist's info and top tracks.
1. Get creative with your designs!
1. Implement Apple Sign In

## Rubric

You must score at least 70 points to pass the assignment. Breakdown of points below:

1. **(15 points):** Code Quality: intuitive variable names, conventional casing, clear comments, modules are flexible and local, short line lengths, proper formatting.
1. **(10 points)** Create a usable design that follows iOS UI Guidelines
1. **(15 points)** Displays 10 most played artists
1. **(15 points)** Tracks can be previewed
1. **(15 points)** Each artist has a view that displays the top 10 tracks by the artist
1. **(15 points)** Ability to favorite a top track, and view all favorites in a list in a separate view
1. **(5 points)** Uses Spotify API/SDK
1. **(5 points)** Evidence of using Time Profiler
1. **(5 points)** Code on GitHub. Include a [README file](https://github.com/matiassingers/awesome-readme)

## Resources
- [Spotify API Docs](https://developer.spotify.com/documentation/web-api/)
- [Spotify SDK Docs](https://developer.spotify.com/documentation/ios/)
- [Spotify Authorization Guide](https://developer.spotify.com/documentation/general/guides/authorization-guide/)
- [Spartan Library](https://github.com/Daltron/Spartan)

## Past Students' Work

- [Example 1](https://github.com/MondaleFelix/MusicApp)
- [Example 2](https://github.com/caocmai/spotiFav)
- [Example 3](https://github.com/ellojess/cantatio)
