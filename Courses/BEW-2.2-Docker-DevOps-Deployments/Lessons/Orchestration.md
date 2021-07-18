# Container Orchestration

## Overview (30 min)

Compose is a tool for **defining and running multi-container Docker applications**.

With Compose, you use a **YAML file (`docker-compose.yml`) to configure your application’s services**. Then, **with a single command**, you **create and start all the services from your configuration**.

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

## Activity I (60 min)

### Level I Challenge

Use the following tutorial to dig in to container orchestration by [dockerising a Node.js and MongoDB app](https://medium.com/statuscode/dockerising-a-node-js-and-mongodb-app-d22047e2806f).

### Level II Challenge

Learn about [Portainer](https://www.portainer.io/), then add it to your `docker-compose.yml` file!

Use this [sample config](https://portainer.readthedocs.io/en/stable/deployment.html#deploy-portainer-via-docker-compose) to get started.

### Level III Challenge

Add `nginx` reverse-proxying to your `docker-compose.yml` file. You may need to research what reverse-proxying is in order to complete this challenge!

It should translate incoming requests on port `80` and send them to port `3000`, just like in production.

## Additional Resources

- **[Overview of Docker Compose](https://docs.docker.com/compose/overview)**
- [Compose File V3 Reference](https://docs.docker.com/compose/compose-file/)
- **[Docker Compose in Production](https://docs.docker.com/compose/production/)**: When you define your app with Compose in development, you can use this definition to run your application in different environments such as CI, staging, and production.
