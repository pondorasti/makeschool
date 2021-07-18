# Advanced Container Orchestration Techniques

<!-- omit in toc -->
## Table of Contents

- [Why You Should Know This (2 min)](#why-you-should-know-this-2-min)
- [Learning Objectives (3 min)](#learning-objectives-3-min)
- [Overview / TT (30 min)](#overview--tt-30-min)
  - [`Dockerfile` or `docker-compose.yml`?](#dockerfile-or-docker-composeyml)
  - [One Command to Get Started](#one-command-to-get-started)
  - [Variable Substitution](#variable-substitution)
  - [Use `.env` For Local Environment Settings](#use-env-for-local-environment-settings)
  - [Override Compose Files Safely](#override-compose-files-safely)
  - [Auto-Format Your Compose File](#auto-format-your-compose-file)
  - [Waiting on a Dependency](#waiting-on-a-dependency)
- [BREAK (10 min)](#break-10-min)
- [Lab Time](#lab-time)
- [Additional Resources](#additional-resources)

## Why You Should Know This (2 min)

Today's plan focuses on **tips and tricks I learned using `docker-compose` IRL**!

## Learning Objectives (3 min)

## Overview / TT (30 min)

Let's go over some strategies and best practices I've personally leveraged in the real world when architecting containers to deploy my applications to my developers and stakeholders.

### `Dockerfile` or `docker-compose.yml`?

A `Dockerfile` contains everything needed to set up the environment to run your application. `Dockerfiles` typically follow this recipe:

 1. Start with an image.
 2. Create a directory for your project inside the container.
 3. Copy the project's code to the directory inside the container.
 4. Install the project's dependencies using a package manager _(`npm`, `pip`, etc)_.
 5. Expose the port(s) the application will run on.
 6. Run a command _(`npm start`, `flask run`, etc)_.

`docker-compose.yml` is a supplement to a `Dockerfile` that enables developers to configure and launch one to many containers at once --- your application included!

### One Command to Get Started

When a new developer clones your repository, they should only need to run `docker-compose up` to get started.



### Variable Substitution

Imagine you have a `docker-compose.yml` file in your project with the following configuration:

```yaml
version: '2'
services:
  ghost:
    image: ghost:${GHOST_VERSION}
    ports:
      - ${GHOST_PORT}:2368
```

Set `GHOST_VERSION` and `GHOST_PORT` all in one command by running `GHOST_VERSION=2 GHOST_PORT=8080 docker-compose up`!

### Use `.env` For Local Environment Settings

Compose supports declaring default environment variables in an environment file named `.env` placed in the folder where the `docker-compose` command is executed (current working directory).

**Syntax Rules**:

- Compose expects each line in the `.env` file to be in `VAR=VAL` format.
- Lines beginning with `#` are processed as comments and ignored.
- Blank lines are ignored.
- There is no special handling of quotation marks.
    - This means that they are part of the `VAL`.

### Override Compose Files Safely

1. Add ` *.override.yml` to the `.gitignore` file in the root of the repository.
2. Create a `docker-compose.override.yml` file in order to set custom settings and override the root `docker-compose.yml` file.
3. Level up your DevOps strategy by adding a `docker-compose.override.sample.yml` file to your repository. Make sure there are lots of comments that clearly explain which values can be customized for each developer's environment!


### Auto-Format Your Compose File

Compose files can get messy and difficult to read quickly, especially in microservice architectures. Use this handy [`compose_format`](https://github.com/funkwerk/compose_format) command to check your Compose file and auto-format it based on best practices for readability.

```bash
cat docker-compose.yml | docker run -i funkwerk/compose_format
```

### Waiting on a Dependency

`mongo`, `postgres`, and many other dependencies take time to start up.

How do you get a container to start _before_ another?

**`Dockerfile`**:

```Dockerfile
FROM node:latest

RUN mkdir -p /usr/src/project_name
WORKDIR /usr/src/project_name

COPY package*.json /usr/src/project_name/
RUN npm install
COPY . /usr/src/project_name

EXPOSE 3000

# Launch the wait tool, then your application.
# Source: https://dev.to/hugodias/wait-for-mongodb-to-start-on-docker-3h8b
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait
CMD /wait && npm start
```

**`docker-compose.yml`**:

```yaml
version: "3.3"
services:
  mongo:
    container_name: mongo
    image: mongo
    volumes:
      - ./data:/data/db
    ports:
      - "27017:27017"

  app:
    container_name: app
    build: .
    ports:
      - "3000:3000"
    links:
      - mongo
    depends_on:
      - mongo
    environment:
      WAIT_HOSTS: mongo:27017

volumes:
  mongo_data:
```

## BREAK (10 min)

## Lab Time

Continue working on your final project, presentation, or blog post. Your instructor will be placing you into framework-based breakout rooms for better support from your peers!

## Additional Resources

1. **[Exception Perceptions: 4 Best Practices for Using Docker Compose](https://blog.sentry.io/2019/02/28/exception-perceptions-docker)**
2. **[Share Compose Configurations Between Files and Projects](https://docs.docker.com/compose/extends/)**
3. **[Control Startup and Shutdown Order in Compose](https://docs.docker.com/compose/startup-order/)
