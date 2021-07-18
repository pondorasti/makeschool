<p align="center"><strong style="color: red;">❌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STOP: DO NOT CLONE THIS REPO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;❌</strong><br>Carefully <b>follow the instructions below</b> to ensure you <b>get credit</b> for this assignment.</p>

---

# 🐳 docker-starter

_Use this required starter pack for all assignments in [BEW 2.2: DevOps, Deployments &amp; Containers](https://make.sc/bew2.2). Follow the instructions below, and submit the resulting repository on [Gradescope](https://make.sc/trackbew2.2) by the assigned due date._

## 📂 Project Files

| Filename | Description |
| -------- | ----------- |
| `.gitignore` | General ignore file. Optimized for Python. |
| `.dockerignore` | A list of files that will not be copied during build. |
| `captain-definition` | **DO NOT MODIFY.** Used by CapRover for deployment. |
| `Dockerfile` | **Implement solutions in this file**. |
| `README.md` | Replace this `README` with content describing the purpose of your project. |

## 🏁 Get Started

1. [Import an existing repository on GitHub](https://github.com/new/import).
1. Under `Your old repository's clone URL`, paste `https://github.com/make-school-labs/docker-starter`.
1. Name your repository according to the assignment instructions.
    <img src="https://github.com/Make-School-Courses/BEW-2.2-Docker-DevOps-Deployments/blob/master/Images/import.png?raw=true" width="60%">
1. Click `Begin Import`.
1. Locally clone your new copy of the starter code.

## 📦 Building & Running

| Variable | Description |
| -------- | ----------- |
| `USERNAME` | Your DockerHub username. |
| `IMAGE_NAME` | Name of the repository created above. |
| `CONTAINER_NAME` | Choose a name for this container.<br>Can be the same as `IMAGE_NAME`. |

### 1️⃣ Build

_Builds the `Dockerfile` found at the current path (`.`)._

```bash
$ docker build -t USERNAME/IMAGE_NAME .
```

### 2️⃣ Run & Test

_Runs the `IMAGE_NAME` image. Deletes the container after executing the `CMD`_.

```bash
$ docker run --rm --name CONTAINER_NAME IMAGE_NAME
```
