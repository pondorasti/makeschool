# 📜 Day 8: Deployment in Django

### ⏱ Agenda

1. [🏆 [5m] Learning Objectives](#%F0%9F%8F%86-5m-Learning-Objectives)
2. [🏁 [15m] Initial Exercise](#%F0%9F%8F%81-15m-Initial-Exercise)
3. [📖 [20m] Overview](#%F0%9F%93%96-20m-Overview)
4. [💻 [30m] In Class Activity I](#%F0%9F%92%BB-30m-In-Class-Activity-I)
5. [🌴 [10m] BREAK](#%F0%9F%8C%B4-10m-BREAK)
6. [💻 [30m] In Class Activity II](#%F0%9F%92%BB-30m-In-Class-Activity-II)
7. [📚 Resources & Credits](#%F0%9F%93%9A-Resources--Credits)

## 🏆 [5m] Learning Objectives

1. Identify and describe the different files required for Django deployment.
1. Implement a deployment strategy for Django on Heroku.

## 🏁 [15m] Initial Exercise

### Thinking About Deployments

With a neighbor, **write down the answers** to the following questions:

1. What is the **primary difference** between Heroku and GitHub Pages?
2. What **role does Gunicorn play** when deploying any Python web server?
3. What is a **Dyno** on Heroku?

## 📖 [20m] Overview

### Why We Use Heroku

- **Simple to Start**: Getting started with Heroku is straightforward; a beginner can set up their first app in less than 10 minutes.
- **Excellent Error Logs**: You have access to real error logging inside the Heroku console as well as on your command line. Heroku deployments, in comparison to other platforms, are simple to debug.
- **Add-Ons**: Heroku has a vast list of plugins and services that can be added to an instance. These plugins cover things from databases to email systems.
- **Simple Scaling**: Heroku instances can easily be scaled up or down by increasing or decreasing the number of available "dynos" for that instance. This can be done through the CLI or through Heroku's own web UI.
- **Dedicated Build Servers**: Heroku has dedicated servers for building app dependencies. This ensures that you won't have issues like "out of memory" errors when deploying your app.
- **Mature**: Heroku is one of the oldest PaaS providers. There's a massive number of articles, guides, and tutorials on Heroku out there for beginners and advanced users.
- **Free Option**: Heroku offers a free tier which contains a single dyno instance. It offers `512MB` of memory and `100MB` swap space.

### What You Need to Deploy

- A working Django site that runs on `localhost`
- `requirements.txt` in the root of your repository
- `Procfile` in the root of your repository

#### Interacting With a Requirements File

**PROTIP**: All commands should be run in the context of an activated `virtualenv`.

##### Generating a Requirements File

To generate a `requirements.txt` file, run the following command in the root of your repository:

```bash
pip freeze > requirements.txt
```

You should freeze your `requirements.txt` file when:

- You install a new package from `pip` (`pip install packagename`).
- You are about to deploy to any platform.

Be sure to add, commit, and push this file to GitHub!

##### Installing From a Requirements File

If a `requirements.txt` file already exists in the repository, run the following command to install all the required packages in your `virtualenv`:

```bash
pip install -r requirements.txt
```

#### Heroku Dependencies

**Web applications that process incoming HTTP requests concurrently make much more efficient use of dyno resources than web applications that only process one request at a time**. Because of this, Heroku recommends using web servers that support *concurrent request processing* whenever developing and running production services.

The Django and Flask web frameworks feature convenient built-in web servers,but **these blocking servers only process a single request at a time**. If you deploy with one of these servers on Heroku, your dyno resources will be **underutilized** and your application will **feel unresponsive**.

**[Gunicorn] is a pure-Python HTTP server for WSGI applications. It allows you to run any Python application concurrently by running multiple Python processes within a single dyno**. It provides a perfect balance of performance, flexibility, and configuration simplicity.

Walk through [Django App Configuration on Heroku](https://devcenter.heroku.com/articles/django-app-configuration) to learn more about what dependencies are required to install Django on Heroku.

#### Writing a Procfile

A `Procfile` looks like this:

```Procfile
web: gunicorn pizzashop:app
```

It consists of **two parts**:

* How/where to run the command (before the colon)
    * **Examples**: `web` or `worker`.
* The command to run in order to execute the web server (after the colon)
    * **Example**: `gunicorn hello:app` runs to the `hello` Django project via Gunicorn.




## 💻 [30m] In Class Activity I

### Deploy Sample Project

**Challenge**: **Use the [Heroku: Getting Started on Heroku with Python] tutorial to deploy to Heroku.** It also serves to refresh your knowledge on everything we've learned in class so far! It will walk you through setting up a sample Django website and pushing it to Heroku.

You may ask your friends or your instructor for help, but **be sure to complete the tutorial on your own machine, and to show the instructor when you've finished**.

**Remember**: *ask the instructor if you have any questions about deploying!*


## 🌴 [10m] BREAK

## 💻 [30m] In Class Activity II

### Deploy MakePizza Project

Find a buddy and use the example you walked through earlier to develop a `Procfile` for the [makepizza](https://github.com/droxey/makepizza) project.

**Challenge**: Can you team up to push `makepizza` to Heroku?

## 📚 Resources & Credits

- **[Gunicorn]**: Gunicorn (aka Green Unicorn) is a Python WSGI HTTP Server for UNIX. It's a pre-fork worker model. The Gunicorn server is broadly compatible with various web frameworks, simply implemented, light on server resources, and fairly speedy.
- **[Heroku: Deploying Python Applications with Gunicorn]**: This guide will walk you through deploying a new Python application to Heroku using the Gunicorn web server.
- **[Heroku: Getting Started on Heroku with Python]**: This tutorial will have you deploying a Python app (a simple Django app) in minutes.
- **[Slant: Heroku vs. GitHub Pages](https://www.slant.co/versus/11233/13313/~heroku_vs_github-pages)**

[Gunicorn]: https://gunicorn.org/
[Heroku: Deploying Python Applications with Gunicorn]: https://devcenter.heroku.com/articles/python-gunicorn
[Heroku: Getting Started on Heroku with Python]: https://devcenter.heroku.com/articles/getting-started-with-python
