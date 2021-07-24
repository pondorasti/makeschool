# Deployment

<!-- omit in toc -->
## Agenda

1. [Learning Objectives (5 minutes)](#learning-objectives-%285-minutes%29)
1. [Warmup: Create a Study Guide (35 minutes)](#warmup%3A-create-a-study-guide-%2835-minutes%29)
1. [Activity: Deploy to Heroku! (45 minutes)](#activity%3A-deploy-to-heroku%21-%2845-minutes%29)
   1. [Install Heroku CLI](#install-heroku-cli)
   1. [Set Up Repository](#set-up-repository)
   1. [Create Procfile](#create-procfile)
   1. [Update `app.js`](#update-%60app.js%60)
   1. [Push to Heroku](#push-to-heroku)
1. [BREAK (15 minutes)](#break-%2815-minutes%29)
1. [Surveys (15 minutes)](#surveys-%2815-minutes%29)
1. [Project Work Time (50 minutes)](#project-work-time-%2850-minutes%29)

## Learning Objectives (5 minutes)

By the end of this class, you should be able to:

1. Push a project to production using Heroku.
1. Progress on your final project.


## Warmup: Create a Study Guide (35 minutes)

In breakouts, create a study guide based on the questions found [here](https://make-school-courses.github.io/BEW-1.3-Server-Side-Architectures-and-Frameworks/#/Assessments/final-assessment).

**You can use your study guide while you're taking the final assessment!**

## Activity: Deploy to Heroku! (45 minutes)

Let's deploy the [GIF Search](https://www.makeschool.com/mediabook/oa/tutorials/gif-search-app-ynu/your-node-environment/) project we worked on at the beginning of class!

### Install Heroku CLI

```bash
brew tap heroku/brew && brew install heroku
```

### Set Up Repository

Make sure you create a file `.gitignore` and give it the following contents:

```bash
node_modules/
.env
```

If your `node_modules` folder was already added to your GitHub repository, make sure you remove it by running the following:

```bash
git rm -r node_modules
```

### Create Procfile

In the root directory of your project, create a file called `Procfile` with the following contents:

```txt
web: node app.js
```

You may also need to add to your "scripts" in `package.json`:

```js
"scripts": {
  "start": "node app.js"
}
```

### Update `app.js`

Update the bottom of `app.js` to contain `PORT`:

```js
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log('Gif Search listening on port localhost:3000!');
})
```

### Push to Heroku

Login to Heroku on the CLI:

```bash
heroku login
```

Create a Heroku app:

```bash
heroku create MY_APP_NAME_HERE
```

Add, commit, and push your files to GitHub as you normally would. Then, push to Heroku:

```bash
git add .
git commit -m "[add] deployment configuration"
git push heroku HEAD:master
heroku open
```

Take a look at the logs with:

```bash
heroku logs --tail
```

## BREAK (15 minutes)

## Surveys (15 minutes)

Take some time to fill out the [class feedback survey](https://www.surveymonkey.com/r/VHVMLYF). We truly value your feedback so make sure to tell us of any suggestions, things you liked, didn't like, etc!

## Project Work Time (50 minutes)

Continue to work on your final project. Submit by Friday @ 11:59pm PST on Gradescope!
