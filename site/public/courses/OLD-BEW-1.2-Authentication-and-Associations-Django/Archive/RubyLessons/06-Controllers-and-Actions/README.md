# Day 6 - Controllers and Actions

## Learning Objectives/Competencies

## Initial Exercise (10 Minutes)

- Continue working on your Ruby Koans.
- Update the tracker with your daily progress!

## Overview/TT I (15 Minutes)

* Present the [Controllers Slide Deck](https://rubygarage.github.io/slides/controllers#/) to the class.

## In Class Activity I

### Forking the Top Tracks API Starter Pack (10 Minutes)

Today, we'll be using the Spotify Web API to create a custom API that allows a user to create a list of their favorite tracks, and rank them in order!

1. Fork my [GitHub Repo](https://github.com/droxey/rails-top-tracks-api) for today's challenges.

1. Clone the repo locally and navigate to it in your shell.

1. Run `rails server` and navigate to the `http://localhost:3000/top_tracks` page.

1. Click the `Sign in with Spotify` to authenticate with OAuth. It will redirect you back to the same page. Once it works, feel free to take a 10 minute break!

## BREAK (10 Minutes)

## Overview/TT II (15 Minutes)

* Before we get into details regarding implementation, it helps to know more about how Ruby on Rails handles requests.

* Present the [Routes Slide Deck](https://rubygarage.github.io/slides/routes#) to the class.

* Finally, present an [overview of the `rspotify` gem](https://www.rubydoc.info/github/guilhermesad/rspotify/master) installed by students during the first half of class.

## In Class Activity II (60 Minutes)

### Scaffolding + Gems = API Magic

Today's deliverable is a link to your GitHub repository with at least one fully implemented `GET` and `POST` action in `app/controllers/top_tracks_controller.rb`.

1. Open `app/controllers/top_tracks_controller.rb`. We'll be doing all our work in this file today.

1. [Review the `rspotify` documentation](https://www.rubydoc.info/github/guilhermesad/rspotify/master) and consider how you would fill in the actions in your controller. For example, can you create an action that would find information about a certain track?

1. Create the API! It can return either a JSON response, or a Rails view containing the data.

1. Add, commit, and push your changes to GitHub once complete.

1. Slack the link to the `#bew1-3` channel.

1. If you finish early, add more features! Example stretch challenge: can you create an action that returns recommendations based on the already provided track data?

## Additional Resources

* [RSpotify GitHub](https://github.com/guilhermesad/rspotify)
* [RSpotify Authentication](https://github.com/guilhermesad/rspotify#rails--oauth)
