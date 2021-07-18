# autograder-golang

_Gradescope autograder for BEW 2.5: Patterns &amp; Practices in Strongly Typed Languages._

### Table of Contents

1. [Integrating with Gradescope](#integrating-with-gradescope)
2. [Deploying or Updating an Autograder](#deploying-or-updating-an-autograder)
3. [Resources](#resources)

## Integrating with Gradescope

<p align="center">
  <img src="https://github.com/droxey/autograder-golang/blob/master/docs/config.png">
</p>

## Deploying or Updating an Autograder

```bash
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: DOCKERHUB_USERNAME
Password:
Login Succeeded
```

```bash
$ docker build .
Sending build context to Docker daemon  61.44kB
Step 1/8 : FROM gradescope/auto-builds
...
```

```bash
$ docker tag 0e129b876bc9 DOCKERHUB_USERNAME/autograder-golang:PROJECT_NAME

```

```bash
$ docker push DOCKERHUB_USERNAME/autograder-golang

The push refers to repository [docker.io/DOCKERHUB_USERNAME/autograder-golang]
...
```

## Resources

https://gradescope-autograders.readthedocs.io/en/latest/specs/

