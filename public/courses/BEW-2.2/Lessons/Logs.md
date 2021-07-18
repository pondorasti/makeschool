# Logging Locally & Remotely

### Table of Contents

1. [Why You Should Know This (2 min)](#why-you-should-know-this-2-min)
2. [Learning Objectives (3 min)](#learning-objectives-3-min)
3. [Initial Exercise (20 min)](#initial-exercise-20-min)
4. [Overview/TT I (30 min)](#overviewtt-i-30-min)
5. [BREAK (10 min)](#break-10-min)
6. [In Class Activity I (60 min)](#in-class-activity-i-60-min)
7. [Wrap Up](#wrap-up)
8. [Additional Resources / Credits](#additional-resources--credits)

## Why You Should Know This (2 min)

**Logs are everything**! Logging allows you to know what happened locally, or remotely, at any given moment in time.

## Learning Objectives (3 min)

1. Identify and describe how a Docker container streams its' output.
2. Define rolling logs and their purpose.
3. Implement your very own exception handling and logging server.

## Initial Exercise (20 min)

Read about how to [set up log rotation for a Docker container](https://medium.freecodecamp.org/how-to-setup-log-rotation-for-a-docker-container-a508093912b2) in this excellent blog post that introduces today's material!

## Overview/TT I (30 min)

Traditionally, designing and implementing centralized logging is an after-thought --- It is not until problems arise that priorities shift to a centralized logging solution to query, view, and analyze the logs so the root-cause of the problem can be found. However, in the container era, it is critical to prioritize centralized logging. As the number of micro-services deployed in containers increases, the amount of data produced by them in the form of logs (or events) exponentially increases.

Go through [Docker Logging Best Practices](https://success.docker.com/article/logging-best-practices) and discuss the following:

* Understanding Docker Logging
* Docker Logs Categories and Sources

Additionally, introduce [Sentry](https://sentry.io) (a real-world enterprise level exception handling and logging tool) to the class, and walk through it's features.

## BREAK (10 min)

## In Class Activity I (60 min)

One of my favorite logging and exception handling solutions, Sentry, allows developers to self-host the platform. You can make your own using [this guide](https://mikedombrowski.com/2018/03/self-hosting-sentry-with-docker-and-docker-compose/).

## Wrap Up

- Continue working on your KataCoda exercises. We will check in on these together during next class period.

## Additional Resources / Credits

1. [Logging Best Practices](https://success.docker.com/article/logging-best-practices)
