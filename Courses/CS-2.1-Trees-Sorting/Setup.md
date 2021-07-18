## Repository Setup Instructions

The course's *upstream* repository (located at `https://github.com/Make-School-Courses/CS-2.1-Trees-Sorting`) contains course materials including the schedule, class topics, challenges, starter code, unit tests, slides, and links to resources.
It will be updated throughout the course, so you will need to regularly *pull* from it to get new materials.
(Note that you cannot *push* to the course's upstream repository.)
However, you can *clone* this repo to get upstream changes and also push your code to your own repo.

**Important:**
Please follow these instructions *exactly* to correctly set up your clone of this repository. If you skip a step or do them out of order, it may not work.

**Step 1:**
Set up your local clone of this course repo on your computer.

1. **Clone** (do not *fork*) this repo from GitHub onto your local computer.

  - First open your terminal and navigate into the folder where you keep your course material and projects:
  `cd ~/MakeSchool/Courses` (or something similar for your folders)

  - Then run this command to *clone* the course repo:
  `git clone https://github.com/Make-School-Courses/CS-2.1-Trees-Sorting.git`

  - Now navigate into the new folder Git just created:
  `cd CS-2.1-Trees-Sorting`

1. [**Create a new empty repo** on GitHub](https://github.com/new) also named `CS-2.1-Trees-Sorting` and **do not** initialize it with a ReadMe. (Creating a *new* repo instead of a *fork* allows you to earn credit towards your GitHub commit streak.)

1. **Set the `origin` remote's URL** on your local repo to point to your new repo on GitHub:
`git remote set-url origin https://github.com/<your-username>/CS-2.1-Trees-Sorting.git`

1. **Push your local repo** to your *remote* GitHub repo to link your `master` branch to your `origin` remote:
`git push -u origin master`

1. **Commit your code** to your local repo frequently (each time you've made meaningful progress).

1. **Push your commits** to your remote GitHub repo when you want to publish and backup your code:
`git push` (the `-u` in the previous command lets you omit `origin master` afterward).

**Step 2:**
Connect your local clone of this course repo to the *upstream* repo on GitHub.

1. Add this course's upstream repo as another *remote* to your local repo with:
`git remote add upstream https://github.com/Make-School-Courses/CS-2.1-Trees-Sorting.git`

1. Verify that you have two remotes: `origin` (with your username in the URL) and `upstream` (with `Make-School-Courses`):
`git remote -v`

1. When you want to access new course materials, first be sure you've committed and pushed your recent work (run `git status` to check) and then *pull* from the course's upstream repo with:
`git pull upstream master`

**Note:**
To avoid unnecessary merge conflicts when pulling changes from `upstream`, write all of your project code inside the `Code` folder and **do not** modify or delete any existing files outside of the `Code` folder that may change upstream.
