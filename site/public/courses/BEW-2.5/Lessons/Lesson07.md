<p align="center">
  <img src="https://cdn-images-1.medium.com/max/800/1*lPX8LWWRYZRZzF9E3rSw0g.jpeg" height="150">
</p>

# Concurrency: Goroutines & Practical Applications

## Learning Objectives

1. Define how concurrency works in Golang.
2. Build an interactive slackbot using goroutines.

## Overview/TT I (30 min)

Present [Learning Go's Concurrency Through Illustrations](/Resources/GoConcurrencyVisualized.md).
- Source: [link](https://medium.com/@trevor4e/learning-gos-concurrency-through-illustrations-8c4aff603b3)


## In Class Activity I (15 min)

**Before Starting**: Brainstorm **command(s)** you'd like your Slackbot to perform.

### Create New Slack App

1. **Have these docs open and ready as you configure a [Slack Bot User](https://api.slack.com/bot-users)**.
2. Point your browser to the **[Create a Slack App]((https://api.slack.com/apps?new_app=1))** page.
3. Enter a **name that fits the problem you're trying to solve**.
4. Select **Product College workspace** from the Workspace drop-down.
5. Click the **Create App** button.
6. On the sidebar, under the Features header, click **Bot Users**.
7. Git your bot a **display name** and a **default username**.
8. Click the **Save Changes** button.
9. Go to **OAuth & Permissions** and scroll down to the **Scopes** > **Select Permission Scopes** text entry field.
10. Add `channels:history`, `channels:read`, and `channels:write` permission scope and click **Save Changes**.
11. Click **Install App to Workplace**, and make sure you set the contents of the  dialog to match the below screenshot. This ensures your bot replies in a particular channel:`#golang-slackbots`. Make sure your **OAuth dialog matches the following**:

<p align="center">
  <img src="img/oauth-enable.png" height="350">
</p>

### Setup Project

1. **Fork** this [starter repo](https://github.com/droxey/goslackit).
   1. It is best if you **work from one computer today**.
2. **Clone the forked repo** to your local machine and `cd REPO_NAME`.
3. Create a `.env` file by running `cp .env.sample .env`.
4. **Paste the Bot Token** from Step 9 in `.env` after `BOT_OAUTH_ACCESS_TOKEN=`.
5. Run `go run main.go` to **start the server**.
   1. If it fails to start, **let the instructor know**.

## BREAK (10 min)

## In Class Activity II (60 min)

**If you get stuck, the following tutorial can assist: [Writing Slackbots with Goroutines](https://x-team.com/blog/writing-slackbots-with-goroutines/)**

* There are **3 challenges** written in the project's comments.
  * **Search the project** for `TODO` in order to find them.
* **Complete** each with the help of your team.
  * **Examine the output** of `go run main.go`.
  * Manually **test the bot via Slack** while completing the activity.
* An additional **stretch challenge** is available if you finish early.

## After Class (10 min)

### Heroku Deployment

Deploying your bot means it will run forever --- even when your computer isn't on!

**Use this sample script to deploy your bot to Heroku**:

```bash
$ git clone git@github.com:USERNAME/goslackit.git PROJECT_NAME
$ cd PROJECT_NAME
$ heroku create PROJECT_NAME
$ heroku config:set BOT_OAUTH_ACCESS_TOKEN=YOUR_BOT_TOKEN
$ git push heroku master
$ heroku ps:scale worker=1
```

## Additional Resources

* **[The Go Blog](https://blog.golang.org/modules2019)**: Go Modules in 2019
* **[Golang Bootcamp](http://www.golangbootcamp.com/book/concurrency)**: Concurrency chapter. Be sure to execute the code samples!
* **[(2012) OG Golang Talk: Concurrency is not Parallelism](https://talks.golang.org/2012/waza.slide)**: Slide deck by Rob Pike.
* **[Learn Go with Tests](https://github.com/quii/learn-go-with-tests/blob/master/concurrency.md)**
* **[A Complete Journey with Goroutines](https://medium.com/@riteeksrivastava/a-complete-journey-with-goroutines-8472630c7f5c)**
* **[Concurrency in Go: Visualization with Example](https://medium.com/@dmrajkarthick.2012/concurrency-in-go-visualization-with-example-8deaf2cf3ee6)**: Awesome visualization that implements a goroutine.
