## Repository Setup Instructions

The course's *source* repository (located at `https://github.com/Make-School-Courses/CS-2-Tweet-Generator`) contains course materials including the schedule, class topics, tutorial milestones, challenges, starter code, unit tests, slides, and links to resources.
It will be continuously updated throughout the course, so you will need to regularly *pull* from it to get new materials.
(Note that you cannot *push* to the course's source repository.)
However, you can *fork* it to create a copy and push code to your own fork.

**Important:**
Please follow these instructions *exactly* to correctly set up your fork of this repository. If you skip a step or do them out of order, it may not work.

1. Fork the course's source repo on GitHub to create your own copy of it on your GitHub account, which should also be named `CS-2-Tweet-Generator`

1. Visit your fork on GitHub and clone *that* repo onto your local computer:
`git clone https://github.com/<your-username>/CS-2-Tweet-Generator.git`

1. Push once to link your local repo to your *remote* forked GitHub repo with:
`git push -u origin master`

1. Each time you've completed a challenge, you should *commit* your work. When you want to share code for review, *push* it to your remote GitHub repo with:
`git push` (the `-u` in the previous command lets you omit `origin master`)

1. Add this course's source repo as another *remote* to your local repo with:
`git remote add course https://github.com/Make-School-Courses/CS-2-Tweet-Generator.git`

1. When you want to access new course materials, first be sure you've committed and pushed your recent work (run `git status` to check) and then *pull* from the course's source repo with:
`git pull course master`

1. To earn credit towards your streak for commits to this repo, you'll need to create another repo on GitHub named `Tweet-Generator` (no `CS-2-` prefix) and **do not** initialize it with a ReadMe.

1. Add that new GitHub repo as another URL to the `origin` remote on your local repo with:
`git remote set-url --add origin https://github.com/<your-username>/Tweet-Generator.git`

1. Verify that the `origin` remote has two distinct URLs with `(push)` after them with:
`git remote -v`

1. Now, after each time you complete a challenge and *commit* your work, you can *push* it to both remote GitHub repos with one simple command:
`git push`
