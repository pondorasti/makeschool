<p align="center"><img src="Images/docker.svg" height="200"></p>

# Docker, DevOps, & Deployments

<span class="refresh-instructions">This syllabus is a living document! Hold down the `SHIFT` key and press `Refresh` to get the latest version.</span>

<!-- omit in toc -->
## Table of Contents

- [Course Description](#course-description)
- [Prerequisites](#prerequisites)
- [Course Specifics](#course-specifics)
- [Learning Outcomes](#learning-outcomes)
- [Schedule](#schedule)
- [Class Assignments](#class-assignments)
  - [Tutorials](#tutorials)
  - [Challenges](#challenges)
  - [Final Project](#final-project)
- [Evaluation](#evaluation)
- [Academic Honesty Policy](#academic-honesty-policy)
- [Information Resources](#information-resources)
- [Make School Course Policies](#make-school-course-policies)

## Course Description

In this course students will learn the two main flavors of Developer Operations (DevOps), one that uses containers and one that does not. Students will learn the leading container pattern with Docker and explore the pros and cons of containers by implementing them. The course will tie this pattern together with generic patterns of operation, such as environmental design, development controls, and uptime management.

## Prerequisites

- [BEW 1.1](https://make.sc/bew1-1)
- [BEW 1.2](https://make.sc/bew1-2)

## Course Specifics

**Course Delivery**: online | 7 weeks | 14 sessions<br>
**Course Credits**: 3 units | 37.5 Seat Hours | 75 Total Hours

## Learning Outcomes

_By the end of this course, you will be able to&hellip;_

1. Build, deploy, and orchestrate that containers in any web-based application.
1. Compare and contrast traditional and container-based deployment patterns.
1. Demonstrate proficiency for professional DevOps roles.
1. Implement and maintain a cloud infrastructure utilizing traditional DevOps techniques.

## Schedule

**Course Dates:** Monday, May 31 – Wednesday, July 28, 2021 (9 weeks)

**Class Times:** Monday, Wednesday at 4:00pm–5:30pm (16 class sessions)

| Class |          Date          |                 Topics                  |
|:-----:|:----------------------:|:---------------------------------------:|
|  - |  Mon, May 31         | **No Class - Memorial Day** |
|  1 |  Wed, June 2         | [Course Orientation]                                                      |
|  2 |  Mon, June 7         | [How Containers Work]                                                     |                                                      
|  3 |  Wed, June 9         | 🔬 **Lab**: [Scripting in Bash]                                                           |
|  4 |  Mon, June 14        | [Domains & DNS]                                                     |
|  5 |  Wed, June 16        | [Dockerizing Web Apps] + [Dockerizing Your Web App]                                     |
|  6 |  Mon, June 21        | [Docker Compose] + 📝 **Lab**: [Review Worksheet]: _Containers, Orchestration, Optimization_     |
|  7 |  Wed, June 23        | [Domains & Droplets] |
|  8 |  Mon, June 28        | [Your Personal PaaS]                  |
|  9 |  Wed, June 30        | [Alerts] + [Continuous Integration]                              |
| -  |  Mon, July 5         | **No Class - Independence Day Observed** |
| 10 |  Wed, July 7         | [Project Kickoff]                                                              |
| 11 |  Mon, July 12        | [Docker Volumes] + [Advanced Container Orchestration Techniques]                  |
| 12 |  Wed, July 14        | Demo: Deploying on CapRover + [Course Review]                         |

<!-- [Final Presentations] -->

## Class Recordings

All class recordings will be available [here](https://drive.google.com/drive/folders/17yRdgDIsZoD4XjOUTwqH2U-F2_nY6b6P?usp=sharing) no later than 24 hours after the class session. For privacy reasons, please do not share the recordings outside of the Make School student body.

## Class Assignments

### Tutorials

To access each tutorial, click the links below. Be sure to complete the exercise in your browser and follow each instruction carefully.

**_Complete all five tutorials before the midterm_**:

| Name | Description | Due Date |
| ---- | ----------- | -------- |
| **Tutorial 1**: [Your First Linux Containers](https://training.play-with-docker.com/ops-s1-hello) | _Explore Docker fundamentals._ | **June 7 @ 11:59PM** |
| **Tutorial 2**: [Deploy and Manage Multiple Containers](https://training.play-with-docker.com/ops-s1-swarm-intro) | _Scale like the pros using Swarm and Compose._ | **June 7 @ 11:59PM** |
| **Tutorial 3**: [Doing More with Docker Images](https://training.play-with-docker.com/ops-s1-images) | _Create & share Docker images; examine the layers inside._ | **June 7 @ 11:59PM** |
| **Tutorial 4**: [Docker Networking Lab](https://training.play-with-docker.com/docker-networking-hol) | _Hands-on practice using key Docker Networking concepts_. | **June 14 @ 11:59PM** |
| **Tutorial 5**: [Docker Orchestration Lab](https://training.play-with-docker.com/orchestration-hol) | _Hands-on practice in high-availability techniques._ | **June 14  @ 11:59PM** |


Knowledge gained in the tutorials will be evaluated on the [Containers, Orchestration, Optimization](https://www.gradescope.com/courses/203051/assignments/835995) worksheet as well as participation during the final [Course Review].

### Challenges

Gain valuable real-world experience in DevOps through these hands-on activities.

**_Complete all five challenges to pass the course_**:

| Name | More Info | Due Date |
| ---- | ----------- | -------- |
| **Challenge 1**: Your Own Domain Name  | [Instructions](Projects/Challenges.md) | **June 10 @ 11:59PM** |
| **Challenge 2**: Connect Your Domain to GitHub Pages | [Instructions](Guides/InfiniteGithubPages.md) | **June 12 @ 11:59PM** |
| **Challenge 3**: Dockerize Any Flask Application | [Instructions](Projects/Challenges.md) | **June 17 @ 11:59PM** |
| **Challenge 4**: Your First Server | [Instructions](Projects/Challenges.md) | **June 19 @ 11:59PM** |
| **Challenge 5**: Compose a Web Application | [Instructions](Projects/Challenges.md) | **June 24 @ 11:59PM**  |


### Final Project

**In your final project, you'll add the following features to an existing codebase of your choosing**:

- **Develop** a `Dockerfile` and `docker-compose.yml` file that successfully deploys any web application or open source project.
- **Deploy** your application's image to your own cloud production server.
- **Monitor** your application’s uptime using a health check.
- **Demonstrate** confidence writing and speaking about Docker, DevOps, and deployment topics by summarizing the experience in a blog post.

**_Review the [Requirements Document](Projects/FinalProject.md) to learn more about the project, including_**:

- [⭐️ Project Goals](#%e2%ad%90%ef%b8%8f-project-goals)
- [📋 Project Requirements](#%f0%9f%93%8b-project-requirements)
- [🗓 Deliverables & Due Dates](#%f0%9f%97%93-deliverables--due-dates)
  - [1️⃣ **Presentation**: Due July 12 @ 11:59pm](#1%ef%b8%8f%e2%83%a3-presentation-due-129--1159pm)
  - [2️⃣ **Blog Post**: Due July 12 @ 11:59pm](#2%ef%b8%8f%e2%83%a3-blog-post-due-129--1159pm)
  - [3️⃣ **Repository**: Due July 12 @ 11:59pm](#3%ef%b8%8f%e2%83%a3-repository-due-129--1159pm)

## Evaluation

**To pass this course, you must**:

- **Complete all five tutorials** listed in the [**Tutorials**](#tutorials) section.
- **Complete all five DevOps challenges** listed in the [**Challenges**](#challenges) section; each submitted on [Gradescope] when complete.
  - URL-based deliverables must return a valid response to earn full credit.
  - Docker-based deliverables that successfully build and run to earn full credit.
- **Submit a [final project](Projects/FinalProject.md) on [Gradescope]** and pass according to the [rubric](Projects/FinalProject.md#rubric).
- Actively **participate in class** and **abide by the attendance policy**.
- **Make up all classwork** from all absences.

## Academic Honesty Policy

At Make School, we highly encourage collaboration between students on assignments. Working with other people is the best way to learn!

However, there's a big difference between **collaboration** (writing code together with another person) and **plagiarism** (copying code from a classmate or outside source without providing proper attribution).

Here are some guidelines to follow in order to avoid plagiarism:

1. If you are looking at an outside source for help, **close the window** containing the code before writing your own solution.
1. Do not write down a line of code unless you **completely understand** how it works. (This is true even if the source you're referencing is the lesson slides/examples/etc!)
1. If your code is still similar to an outside source or another student's, **provide attribution** by adding a comment to your code explaining where it was taken from.

We take academic honesty very seriously at Make School. The consequences for violating the policy are as follows:

- You will be required to write a [Self-Reflection Letter](https://docs.google.com/document/d/140_PHfDh7gu33OZI_caxEtvNzAlAepjnGcbQcXZ-MRo/edit?usp=sharing) to reflect on how your actions affected others.
- If this is your first offense, you may be permitted to redo the assignment for a reduced grade (at the instructor's discretion).
- The incident will be added to your permanent record at Make School and you may be placed on a Participation Improvement Plan (PIP).

For subsequent offenses, more serious consequences may be considered. For more information, please see [Make School's academic honesty policy](https://make.sc/academic-honesty-policy).

## Information Resources

Any additional resources you may need (online books, etc.) can be found here. You can also find additional resources through the library linked below:

- [make.sc/library](http://make.sc/library)

## Make School Course Policies

- [Program Learning Outcomes](https://make.sc/program-learning-outcomes) - What you will achieve after finishing Make School, all courses are designed around these outcomes.
- [Grading System](https://make.sc/grading-system) - How grading is done at Make School
- [Diversity and Inclusion Statement](https://make.sc/diversity-and-inclusion-statement) - Learn about Diversity and Inclusion at Make School
- [Academic Honesty](https://make.sc/academic-honesty-policy) - Our policies around plagiarism, cheating, and other forms of academic misconduct
- [Attendance Policy](https://make.sc/attendance-policy) - What we expect from you in terms of attendance for all classes at Make School
- [Course Credit Policy](https://make.sc/course-credit-policy) - Our policy for how you obtain credit for your courses
- [Disability Services (Academic Accommodations)](https://make.sc/disability-services) - Services and accommodations we provide for students
- [Student Handbook](https://make.sc/student-handbook) - Guidelines, policies, and resources for all Make School students

[Alerts]: Lessons/Alerts.md
[Architecture Diagrams]: Lessons/Diagrams.md
[Code Once, Run Anywhere]: Lessons/Containers.md
[Continuous Integration]: https://docs.google.com/presentation/d/18DNt9UXHaPUufQogj-mThiKpvhkJzXprnPmQtaptUp8
[Course Orientation]: Lessons/CourseOrientation.md
[Docker Compose]: Lessons/Compose.md
[Docker Hub]: Lessons/Hub.md
[Docker Swarm]: Lessons/Swarm.md
[Dockerizing Web Apps]: Lessons/WebServers.md
[Dockerizing Your Web App]: Lessons/WebServers.md#60m--lab-writing-dockerfiles
[Domains & DNS]: Lessons/DNS.md
[Domains & Droplets]: Lessons/Droplets.md
[Final Presentations]: Projects/FinalProject.md#Deliverables
[Final Project]: Projects/FinalProject.md
[Gradescope]: https://www.gradescope.com/courses/203051
[How Containers Work]: Lessons/Dockerfiles.md
[Multi-Stage Builds]: Lessons/Builds.md
[Networking]: Lessons/Networking.md
[Project Kickoff]: Projects/FinalProject.md
[Review Worksheet]: https://www.gradescope.com/courses/203051/assignments/835995
[Scripting in Bash]: https://github.com/veltman/clmystery
[Security]: Lessons/Security.md
[Volumes]: Lessons/Volumes.md
[Your Personal PaaS]: Lessons/PaaS.md
[Docker Volumes]: Lessons/Volumes.md
[Advanced Container Orchestration Techniques]: Lessons/AdvancedOrchestration.md
[Course Review]: Lessons/CourseReview.md
