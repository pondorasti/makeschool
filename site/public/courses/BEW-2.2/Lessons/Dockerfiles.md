# 🐳 How Containers Work

<!-- > -->

⭐️ **GOAL**: Introduce the course and inform students on the purpose of Docker.

<!-- omit in toc -->
## ⏱ Agenda

1. [🏆 Objectives](#%f0%9f%8f%86-objectives)
1. [🎓 Terminology](#%f0%9f%8e%93-terminology)
1. [👩‍🏫 [15m] Instructor: Recap](#%f0%9f%91%a9%e2%80%8d%f0%9f%8f%ab-15m-instructor-recap)
   1. [The Purpose of Containers](#the-purpose-of-containers)
   1. [Distribute Everything You Need to Run a Codebase](#distribute-everything-you-need-to-run-a-codebase)
   1. [Images Are Made of Layers](#images-are-made-of-layers)
   1. [1 Line of Code in Dockerfile = 1 Layer in Image](#1-line-of-code-in-dockerfile--1-layer-in-image)
1. [💻 [20m] Instructor: Demo](#%f0%9f%92%bb-20m-instructor-demo)
1. [🙏 Credits](#%f0%9f%99%8f-credits)

<!-- > -->

## 🏆 Objectives

1. Expand existing knowledge of common bash commands.
1. Create a `Dockerfile` that installs a dependency and runs several bash commands.

<!-- > -->

## 🎓 Terminology

_Copy the blank markdown table below, then paste it into your notes._

_While participating in class, fill out the definitions for your reference in the future._

|                   Term |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Definition                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|-----------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| **alpine linux**<br><br> | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| **container** <br><br> |
| **dependency** <br><br> |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **image**       <br><br> |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **layer**       <br><br> |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **tarball**    <br><br> |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

<!-- > -->

## 👩‍🏫 [15m] Instructor: Recap

<!-- v -->

### The Purpose of Containers

**TLDR**: _Everyone's computer is different, even if it looks the same._

<p><img src="https://make-school-courses.github.io/BEW-2.2-Docker-DevOps-Deployments/Lessons/Images/bork-why.jpg" width="700"></p>

<!-- v -->

### Distribute Everything You Need to Run a Codebase

A `Dockerfile` is distributed with the majority of Open Source projects to ensure you can run them on your unique machine.

<p><img src="https://make-school-courses.github.io/BEW-2.2-Docker-DevOps-Deployments/Lessons/Images/bork-dependency.jpg" width="700"></p>

<!-- v -->

### Images Are Made of Layers

<p><img src="https://make-school-courses.github.io/BEW-2.2-Docker-DevOps-Deployments/Lessons/Images/bork-images.jpg" width="700"></p>

<!-- v -->

### 1 Line of Code in Dockerfile = 1 Layer in Image

<p><img src="https://make-school-courses.github.io/BEW-2.2-Docker-DevOps-Deployments/Lessons/Images/bork-layers.jpg" width="700"></p>

<!-- > -->

## 💻 [20m] Instructor: Demo

🌟 **GOAL**: Demonstrate creating a new `Dockerfile` from start to finish:

1. Follow the instructions in [make-school-labs/docker-starter](https://github.com/make-school-labs/docker-starter) repo
1. Use Alpine Linux as the base.
1. Install the `fortune` package.
1. Run the `fortune` command.
1. Build container via `docker build .`
1. Run container via `docker run .`

<!-- > -->

<!-- ## 📚 Resources -->

<!-- > -->

## 🙏 Credits

- [Julia Evans (@bork)](https://twitter.com/b0rk): _Photo credit for comics used in lesson plan._
