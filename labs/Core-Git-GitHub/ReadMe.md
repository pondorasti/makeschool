# Git/Github

## Learning Objectives

1. Understand how to take a real project and integrate it with Git/GitHub.
1. Create well-crafted commit messages.
1. Practice basic pull requests and resolve basic merge conflicts.


## Initial Exercise

Ever heard of version control? Have you used it?

Take a minute to write down what you know it's about or what you imagine it's related to if you're not familiar with the term.

Share your answer and listen to other's comments. Then learn about what it is and why it's important.

## Version Control

A version control system is basically a tracker of the changes made on a project by a group of people who work collaboratively.

As any project grows and evolves, the confidence that any version can be recovered helps teams run tests, fix bugs and add new code.

Developers can review project history to find out:

- Which changes were made?
- Who made the changes?
- When were the changes made?
- Why were changes needed?

Git is an example of a distributed version control system, the most popular in the world as more than 70% of developers use it. Git allows full access to every file, branch, and iteration of a project, and allows every user access to a full and self-contained history of all changes.

No matter where users are in the world, they can collaborate to projects using git at any given time, from anywhere.

**About Github**

GitHub is a Git hosting repository that provides developers with tools to ship better code:
- command line features
- issues (threaded discussions)
- pull requests
- code review

**The Workflow**

The Git flow can be broken down into steps as follows:

1. Create or clone a repository.
1. Make all the changes needed to your files.
1. Add the files to the staging area, what you want to update in the repo.
1. Commit the files and add a message.
1. Push the changes to the repo.

[Source](https://guides.github.com/introduction/git-handbook/)

## In Class Activity I

- [Creating a movie (up to completing step 2: Publish)](MovieActivity.md)

## Collaborating with GitHub

The great thing about Git is the ability to collaborate to a project. To do this we can follow the GitHub flow which looks similar to what you know already but with additional steps:

The GitHub flow has six steps:

1. **Create a branch:** Topic branches allow teams to contribute to many parallel efforts.
1. **Add commits:** Snapshots of development efforts within a branch create safe, revertible points in the project’s history.
1. **Open a pull request:** Pull requests publicize a project’s ongoing efforts and set the tone for a transparent development process.
1. **Discuss and review code:** Teams participate in code reviews by commenting, testing, and reviewing open pull requests. Code review is at the core of an open and participatory culture.
1. **Merge:** Upon clicking merge, GitHub automatically performs the equivalent of a local ‘git merge’ operation. GitHub also keeps the entire branch development history on the merged pull request.
1. **Deploy:** Teams can choose the best release cycles or incorporate continuous integration tools and operate with the assurance that code on the deployment branch has gone through a robust workflow.

[Source](https://guides.github.com/introduction/flow/)

**About branches**
- A branch has a unique set of code changes.
- Use a branch to isolate development work without affecting other branches in the repository.
- Each repository has one default branch (master), and can have multiple other branches.
- You can merge a branch into another branch using a pull request.

[Source](https://help.github.com/en/articles/about-branches)

**Clone vs Fork**

There are 3 ways to create a repository. One is by creating it on our own, to start a new project. But if we want to use an already existing project we can go in two directions: *Clone* or *Fork*.

- A fork is a copy of a repository that allows you to freely experiment with changes without affecting the original project.
- A connection exists between your fork and the original repository itself.
- If you clone a repo you won't be able to pull down changes from the original repository and if the project is owned by someone else you won't be able to contribute back (unless you are a collaborator)

[Source](https://github.community/t5/Support-Protips/The-difference-between-forking-and-cloning-a-repository/ba-p/1372)


## In Class Activity II

- [Creating a movie (up to the end)](MovieActivity.md)

## Commit messages

The git commit subject line should always be able to complete the following sentence:

**If applied, this commit will** *your subject line here*

*Example: Add authentication to login.*

Guidelines:
- Separate subject from body with a blank line
- Use imperative mood in the subject
- Wrap lines at ~70 characters
- Start with capital letters

[Source](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53)

## Additional Resources

1. [Slides](https://docs.google.com/presentation/d/17NWgjqiLIGECLP456hGPU_f_QJNP38dOuSz3IU-R--I/edit?usp=sharing)
1. [MS Branching tutorial](http://make.sc/git-branching)
1. [Info in commit messages](https://wiki.openstack.org/wiki/GitCommitMessages#Information_in_commit_messages)
1. [More sources on resolving merge conflicts](https://codeforphilly.github.io/decentralized-data/tutorials/actually-using-git/lessons/conflicting-branches/)

