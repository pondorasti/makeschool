# 🛤️ rails-top-tracks-api

**Today's deliverable is a link to your GitHub repository with at least one fully implemented `GET` and `POST` action in `app/controllers/top_tracks_controller.rb`.**

## Getting Started: Step by Step

1. Fork this GitHub Repo.
1. Clone your new fork locally and navigate to it in your shell.
1. Run `rails db:migrate` to apply initial migrations.
1. Run `rails server` and navigate to the [http://localhost:3000/top_tracks][http://localhost:3000/top_tracks] page.
1. Click the `Sign in with Spotify` button to authenticate with OAuth. 
1. Open `app/controllers/top_tracks_controller.rb`. All changes should be made in this file!
1. [Review the `rspotify` documentation](https://www.rubydoc.info/github/guilhermesad/rspotify/master) and consider how you would fill in the actions in your controller. For example, can you create an action that would find information about a certain track?
1. Create the API! It can return either a JSON response, or a Rails view containing the data.
1. Add, commit, and push your changeset to GitHub.
1. If you finish early, add more features! Example stretch challenge: can you create an action that returns recommendations based on the already provided track data?

## Important Notes

* You must run this locally and serve the website over port `3000` to ensure access to the Spotify Web API.

## Additional Resources

* [DigitalOcean: How To Use Array Methods in Ruby](https://www.digitalocean.com/community/tutorials/how-to-use-array-methods-in-ruby)
* [rspotify Documentation](https://www.rubydoc.info/github/guilhermesad/rspotify/master)
