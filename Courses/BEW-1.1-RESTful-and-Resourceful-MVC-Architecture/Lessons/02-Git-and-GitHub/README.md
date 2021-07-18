<!-- .slide: data-background="./../Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# Git & Github

### [Slides](https://make-school-courses.github.io/BEW-1.1-RESTful-and-Resourceful-MVC-Architecture/Slides/02-Git-and-GitHub/README.html#/)

<!-- > -->

## Learning Outcomes

1. Understand how to take a real project and integrate it with Git/GitHub.
1. Practice basic pull requests and resolve basic merge conflicts.
1. Use the GitHub Desktop tool to see your changed files and make commits.

<!-- > -->

## Initial Exercise [5 mins]

Think of 3 challenges you have faced when using Git or GitHub. 

Then, share with a partner and compare/contrast your experiences.

<!-- > -->

# Version Control

<!-- v -->

## What is Version Control?

Version control is software that helps a software team manage changes to source code over time. If a mistake is made, developers can turn back the clock and compare earlier versions of the code to help fix the mistake while minimizing disruption to all team members.

Source: [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/what-is-version-control)

<!-- v -->

## Benefits of Version Control

Version control allows you to:

- Review previous versions of your code<!-- .element: class="fragment" -->
- Revert to a previous version in case of errors<!-- .element: class="fragment" -->
- Experiment with new features without fear of breaking your code<!-- .element: class="fragment" -->
- Collaborate effectively & split up work without blocking each other's changes<!-- .element: class="fragment" -->

<!-- v -->

## Git is Decentralized

A centralized file system is like a bank: There is one central "source of truth" with a ledger of all changes made. <!-- .element: class="fragment" -->

GitHub is more like Bitcoin: Every person can have their own version of a repository that is equally valid! <!-- .element: class="fragment" -->


<!-- > -->

# Review: Bash Commands

<!-- v -->

## Bash Commands

How do we do the following in Bash?

- View the current file path? `pwd`<!-- .element: class="fragment" -->
- Make a new directory? `mkdir name_of_directory`<!-- .element: class="fragment" -->
- Navigate into (or out of) a directory? <span> `cd name_of_directory` or `cd ..`</span><!-- .element: class="fragment" -->
- See all files in the current directory? `ls`<!-- .element: class="fragment" -->
- Create a new file? `touch file_name`<!-- .element: class="fragment" -->

<!-- > -->

# Git Workflow

<!-- v -->

## Basic Git Workflow

Here is an example of how to initialize a Git repository:

```bash
$ git init
$ git remote add <remote_name> <remote_url>
```

And how to make changes and push them to GitHub:

```bash
$ git add <your_file_name>
$ git commit -m "Update server code and add 2 routes"
$ git push <remote_name> <branch_name>
```


<aside class="notes">

- `git init` will initialize a Git repository inside of the current directory. We can prove it was initialized by using `ls -a` to see hidden files.
- `git remote add origin` adds a _remote_ (short for "remote repository") named _origin_.
- `git add` is like adding our files to a shopping cart. We may not want to check out just yet - this allows us to still make some changes before pushing.
- `git commit` makes a _commit_ to our local repository containing our changes. It still won't be reflected in GitHub!
- `git push` sends all of the commits we've made to the remote we added. The remote name by default is "origin", and the branch name by default is "master".

Usually, the remote name is called "origin" and the branch name is called "master". It's good to follow this convention unless you have multiple remotes or branches.

</aside>

<!-- v -->

## Pull Changes

You can pull in changes someone else has made with:

```bash
$ git pull <remote_name> <branch_name>
```

<!-- v -->

## Git Clone

Another way to initialize a repository is to _clone_ an existing one.

```bash
$ git clone <remote_url>
```

Note that if you are not the repository's owner (or a collaborator), you will not be able to push your changes! Instead, create a new, empty GitHub repository and add it as a remote with `git remote add` as shown above.

<!-- v -->

## Git Debugging

There are a few useful commands to get the "lay of the land" and aid in debugging:

- `git status` - Run before and/or after adding files
- `git log` - shows previous commits
- `git reflog` - shows all changes made to the repository (not just commits)
- `git diff` - shows diffs in untracked files

<!-- v -->

## gitignore

Add a file called `.gitignore` to specify any files that you don't want to be tracked. For example, my `.gitignore` file might include the following contents:

```
env/
__pycache__
.DS_STORE
```

Check out [gitignore.io](http://gitignore.io/) to automatically generate a .gitignore file!

<!-- v -->

## Activity: Set up your Homework Repository [5 min]

If you haven't yet, initialize a repository in your BEW1.1 Homework folder, and follow the steps to push your changes to GitHub.

<!-- > -->

## Break [10 minutes]
<!-- .slide: data-background="#087CB8" -->

<!-- > -->

# Activity: Create a Merge Conflict

<!-- v -->

## What is a merge conflict?

Merge conflicts occur when you attempt to pull in changes that _conflict with_ (i.e. change the same lines as) your changes.

They are a normal part of working with Git and it's good to practice them!

<!-- v -->

## Let's Create a Merge Conflict! [10 mins]

In your homework directory, change a few lines of code, add, and commit (but don't push).

Then, go to the corresponding GitHub repository and change those _same_ lines of code in a _different_ way.

Try `git pull origin master`. You should get a merge conflict! See if you can resolve it.

<!-- v -->

## Merge Conflicts with a Partner [15 mins]

Pair up with someone you haven't worked with yet.

Clone your partner's repository. Then, both make changes to the _same lines of code_ and try to push your changes. See if you can resolve the merge conflict!

After resolving, commit and push your final changes. Now you should both see the same code.

<!-- > -->

# GitHub Desktop

<!-- v -->

## What is GitHub Desktop?

<aside class="notes">
GitHub Desktop is a desktop client that takes a lot of the pain out of using command-line Git. It will help you do all of the basic commands - add, commit, and push - and will give you visual reminders of what changes you have made.
</aside>

![Screenshot of GitHub Desktop](assets/github_desktop.png)

<!-- v -->

## Why GitHub Desktop?

It is...

- Easy and straightforward to use
- More visual
- Shows side-by-side file diffs

<!-- v -->

## How do I install it?

[Download for MacOS!](https://desktop.github.com/)

<!-- v -->

## Demo

<!-- > -->

## Homework

- Homework 1 - Due Monday at midnight. Link your repo in the [Progress Tracker](https://docs.google.com/spreadsheets/d/14AkHKwhmKjT352FSm-ord8-IDInLp7dFfCCfYbLI4Pw/edit#gid=0) to submit!

<!-- > -->

## Additional Resources

1. [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/setting-up-a-repository) - highly recommended if you want a deeper dive into Git, but most of it is not necessary for your day-to-day work
1. [Fixing Common Mistakes (video)](https://www.youtube.com/watch?v=FdZecVxzJbk&t=954s)
1. [MS Branching tutorial](http://make.sc/git-branching)
1. [Info in commit messages](https://wiki.openstack.org/wiki/GitCommitMessages#Information_in_commit_messages)
1. [More sources on resolving merge conflicts](https://codeforphilly.github.io/decentralized-data/tutorials/actually-using-git/lessons/conflicting-branches/)

