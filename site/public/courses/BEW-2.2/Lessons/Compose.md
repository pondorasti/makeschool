# 🐳 Docker Compose

⭐️ **GOAL**: Run multiple dependencies using Docker Compose.

<!-- omit in toc -->
## ⏱ Agenda

- [[**5m**] Attendance & Announcements](#5m-attendance--announcements)
- [[**30m**] 📖 Overview](#30m--overview)
  - [Features](#features)
  - [Use Cases](#use-cases)
  - [How to Actually Use It](#how-to-actually-use-it)
  - [Compose Commands](#compose-commands)
- [[**10m**] 😎 Break](#10m--break)
- [[**15m**] ⏺ Live Code: Compose & Django](#15m--live-code-compose--django)
  - [Step 1: Define Project Components](#step-1-define-project-components)
  - [Step 2: Connect Database](#step-2-connect-database)
  - [Step 3: Run Compose](#step-3-run-compose)
  - [Other Commands](#other-commands)
- [[**60m**] 🔭 Lab: Compose a Codebase](#60m--lab-compose-a-codebase)

<!-- omit in toc -->
## 🏆 Objectives

1. Define _container orchestration_ and it's role when Dockerizing a web application's dependencies.
1. Practice `docker-compose` through lab time and tutorials.

## [**5m**] Attendance & Announcements

## [**30m**] 📖 Overview

<p align="center">
  <img src="https://cdn.nearsoft.com/uploads/2017/09/docker-compose-lede-800x450.png" width="400">
</p>

Docker Compose is a tool for **defining and running multi-container Docker applications**.

With Docker Compose, you use a **YAML file (`docker-compose.yml`) to configure your application’s services**. Then, **with a single command**, you **create and start all the services from your configuration**.

**This file is created by you, and located in the root of your project directory**.

### Features

- **Multiple isolated environments** on a single host.

- **Preserve volume data** when containers are created.
  - Preserves volumes used by your services.
  - Ensures that any data you’ve created in volumes isn’t lost.
  - When `docker-compose up` runs, if it finds any containers from previous runs, it copies the volumes from the old container to the new container.

- Only **recreate containers if there's been a change**.
  - Caches the configuration used to create a container. When you restart a service that has not changed, Compose re-uses the existing containers. Re-using containers means that you can make changes to your environment very quickly.

- **Variables** / **can move a composition between environments**.
  - You can use variables in your compose file to customize your composition for different environments / different users.
  - See [Variable Substitution](https://docs.docker.com/compose/compose-file/#variable-substitution) for more details.

### Use Cases

- **Development Environments**
  - When you’re developing software, the ability to run an application in an isolated environment and interact with it is crucial.
  - The Compose command line tool allows you to both run an isolated environment ***and*** interact with it.

- **Automated Testing Environments**
  - An important part of any Continuous Deployment or Continuous Integration process is the automated test suite.
  - Automated end-to-end testing requires an environment in which to run tests.
  - Compose provides a convenient way to create and destroy isolated testing environments for your test suite.

- **Single Host Deployments** _(DigitalOcean, AWS, etc)_
  - Compose has traditionally been focused on development and testing workflows, but with each release we’re making progress on more production-oriented features. You can use Compose to deploy to a remote Docker Engine.

### How to Actually Use It

Using Docker Compose is a **three step process**:

1. Define a Dockerfile for each app
1. Define the services that make up the app in `docker-compose.yml`.
1. Run `docker-compose up` to run all your services together.

Congratulations! You have **orchestrated your containers** --- **enabling each app to run together in an isolated environment**.

### Compose Commands

Docker Compose (`docker-compose`) has several commands you can run to manage the lifecycle of the application:

- Start, stop, and rebuild services
- View the status of running services
- Stream the log output of running services
- Run a one-off command on a service

Use this handy [DevHints.io cheatsheet](https://devhints.io/docker-compose) anytime you need to reference `docker-compose` commands.


## [**10m**] 😎 Break

## [**15m**] ⏺ Live Code: Compose & Django

**USE CASE**: You need to run Django with a database locally.

**GOAL**: See how to use docker-compose in real life through a live code demonstration that walks you through the following tutorial: [Quickstart: Compose and Django](https://docs.docker.com/compose/django/).

We'll use a repo I created, [droxey/docker-django](https://github.com/droxey/docker-django), as the starting point for this demonstration.

#### Compose and Django

### Step 1: Define Project Components

1. **Create a file called `docker-compose.yml` in your project directory.**

   The `docker-compose.yml` file describes the services that make your app. In this example those services are a web server and database. The compose file also describes which Docker images these services use, how they link together, any volumes they might need mounted inside the containers. Finally, the `docker-compose.yml` file describes which ports these services expose. See the [`docker-compose.yml` reference](https://docs.docker.com/compose/compose-file/) for more information on how this file works.

2. **Add the following configuration to the file.**

   ```yaml
     version: '3.7'

     services:
       db:
         image: postgres
         environment:
           - POSTGRES_DB=postgres
           - POSTGRES_USER=postgres
           - POSTGRES_PASSWORD=postgres
       web:
         build: .
         command: python manage.py runserver 0.0.0.0:8000
         volumes:
           - .:/code
         ports:
           - "8000:8000"
         depends_on:
           - db
   ```

   This file defines two services: The `db` service and the `web` service.

3. Save and close the `docker-compose.yml` file.

### Step 2: Connect Database

1. Edit the `project/settings.py` file.

2. Replace the `DATABASES = ...` with the following:

   ```python
   # settings.py

   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.postgresql',
           'NAME': 'postgres',
           'USER': 'postgres',
           'PASSWORD': 'postgres',
           'HOST': 'db',
           'PORT': 5432,
       }
   }
   ```

   These settings are determined by the [Postgres](https://hub.docker.com/_/postgres) Docker image specified in `docker-compose.yml`.

3. Save and close the file.

### Step 3: Run Compose

1. Run the [docker-compose up](https://docs.docker.com/compose/reference/up/) command from the top level directory for your project.

2. Go to `http://localhost:8000` on a web browser to see the Hello World page!

   > **Note**:
   >
   > On certain platforms (Windows 10), you might need to edit `ALLOWED_HOSTS` inside `settings.py` and add your Docker host name or IP address to the list. For demo purposes, you can set the value to:
   >
   > ```python
   >   ALLOWED_HOSTS = ['*']
   > ```
   >
   > This value is **not** safe for production usage. Refer to the [Django documentation](https://docs.djangoproject.com/en/1.11/ref/settings/#allowed-hosts) for more information.

### Other Commands

- **List running containers.**

   In another terminal window, list the running Docker processes with the `docker container ls` command.

   ```bash
   $ docker ps
   CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
   def85eff5f51        django_web          "python3 manage.py..."   10 minutes ago      Up 9 minutes        0.0.0.0:8000->8000/tcp   django_web_1
   678ce61c79cc        postgres            "docker-entrypoint..."   20 minutes ago      Up 9 minutes        5432/tcp                 django_db_1
   ```

- **Shut down services and clean up** by using either of these methods:

  - Stop the application by typing `Ctrl-C` in the same shell in where you started it:

      ```bash
      Gracefully stopping... (press Ctrl+C again to force)
      Stopping docker-django_web_1 ... done
      Stopping docker-django_db_1  ... done
      ```

  - Or, for a more elegant shutdown, switch to a different shell, and run [docker-compose down](https://docs.docker.com/compose/reference/down/)from the top level of your Django sample project directory.

## [**60m**] 🔭 Lab: Compose a Codebase

Add a `docker-compose.yml` file to an existing project that requires both a web server and a database.

**IMPORTANT: Be sure to add this file to a project you've already completed in another course. BEW 2.2 focuses on enhancing your existing codebases, rather than starting new repositories from scratch.**

Past students have utilized projects from the following courses to complete this challenge:

- **[FEW 2.3](https://make.sc/few2.3)**: Write a compose file for a React project that utilizes additional services.
- **[SPD 1.5](https://make.sc/spd1.5)**: Simplify day to day development for your SPD team by ensuring your application and it's dependencies run the same on each team member's machine.
- **[BEW 1.1](https://make.sc/bew1.1)**: Compose a Flask project that requires a MongoDB database.
- **[BEW 1.2](https://make.sc/bew1.2)**: Compose a Django project that requires a PostgreSQL database.
- **[BEW 1.3](https://make.sc/bew1.3)**: Compose a Node project that requires a MongoDB database.
- **[BEW 2.5](https://make.sc/bew2.5)**: Compose a Go web application that requires any external database.

<!-- -->

<!-- omit in toc -->
## 📚 Resources & Credits

- [YAML Validator](https://codebeautify.org/yaml-validator): Use this tool to make sure your YAML syntax is valid.
- [Quickstart: Compose & Django](https://docs.docker.com/compose/django/): Today's live code activity modifies this example!
