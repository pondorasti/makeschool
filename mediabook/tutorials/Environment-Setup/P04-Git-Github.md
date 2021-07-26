---
title: "5. Git + GitHub"
slug: git-github
---

Git and Github are super important and awesome tools for tracking, revising, and collaborating on code projects. Let's get your computer setup to use Git and Github.

## Why Use Git?

In short, developers use git to collaborate on a project simultaneously and save snapshots of different versions of the project.

Watch this 5 min video by Paul Programming where he explains the value of using git:

![ms-video-youtube](https://www.youtube.com/watch?v=OqmSzXDrJBk)

## Install / Setup

> [action]
>
> 1. Install git if you haven't already.

    ```bash
    $ brew install git
    ```

> 1. Head over to [github.com](https://github.com) and sign up for an account using your personal email address if you don't already have one.
> 1. Configure your global username and email address.
>
> **‼️ IMPORTANT: If you skip this step, Git will produce a warning each time you push to a remote branch.**

```bash
$ git config --global user.name "YOUR_NAME"
$ git config --global user.email "YOUR_PERSONAL_EMAIL@example.com"
```

> Finally, double-check your settings. They should look similar to the following:

```bash
$ git config --list
>
credential.helper=osxkeychain
user.name=Dani Roxberry
user.email=dani@bitoriented.com
```

If you can’t set this up, don’t worry - we will be giving extra support during orientation.

# Generating and Configuring SSH Keys

SSH keys are a cryptographic way to secure your connection between your computer and GitHub. Setting them up will make it so you don't have to login through your terminal when you are trying to push. Let's set them up:

**‼️ IMPORTANT !!: DO NOT ENTER A PASSWORD WHEN PROMPTED**. Just hit enter after running the `ssh-keygen` command, and do it until you see something on your terminal that looks like the following:

```bash
The key fingerprint is:
SHA256:Up6KjbnEV4Hgfo75YM393QdQsK3Z0aTNBz0DoirrW+c ylo@klar
The key's randomart image is:
+---[RSA 2048]----+
|    .      ..oo..|
|   . . .  . .o.X.|
|    . . o.  ..+ B|
|   .   o.o  .+ ..|
|    ..o.S   o..  |
|   . %o=      .  |
|    @.B...     . |
|   o.=. o. . .  .|
|    .oo  E. . .. |
+----[SHA256]-----+
klar (11:40) ~>
```

_[source](https://www.ssh.com/ssh/keygen/)_

> [action]
>
> Run the following commands, using your email address that you entered earlier.
>
> **‼️ IMPORTANT !!: DO NOT ENTER A PASSWORD WHEN PROMPTED**. Remember to just hit enter after running the `ssh-keygen` command until you get the image that looks like the example above

```bash
$ ssh-keygen -t rsa -C "your.email@example.com" -b 4096
```

> Once again, you will get a few prompts, just keep hitting enter! Once you see something that looks like the above example, run the following command:

```bash
$ cat ~/.ssh/id_rsa.pub
>
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+SJSGSCeSeLnOg543Hyqh3OcAENvugks8ygkoOkEA4g652gK0ES7CjjpBy4GS/XnaUWiD9iaoE4soE8dqhe/psCoiU+QxGmkjNapLtQAOu1W2v/SEh3Jao+rtfop0S+Ak96fiOVgUgupFAN1FXV1iYdpwyk7rR3Kv/T2M9Ce06Bk5KupdgNzF7Eg/tmFx8H2yVmeQ2J3MWM948ZvWmbBwtbcDRQ6ZtnXSoEof1Wg8agzyisq0Yoi3rXqAIxr1Hevs4g79Lrf65548yTfqZqyljSFA/h4VntXsZYKIWoXti5uPstrwRF6oaH8dm1l74jLAKC/XlqnsqVkRWn/Updj+x8g3+EdtFiWpUwEIMWWDbjPk0HHTfOS06716Hcji0hg4Kfipe03QjhD8Vqp/snaYCb8R3OSZOK1H3Zj9n1JgHhOoFYzk0gstV9DGRmrm2ywrQh3Q7fs23pzrZARGBhRHwk5XfFQl85D7oJffBbfpqjDdyzcHYOAo3mlDfwkfl1nHxynWrwCk+0KKD0zLVsqtkSVlNfQv2JqSSc6ox6vktO7RWKg5/T0b9r0fnNcYfGBVnoJDulJPJr7ynSUDRi2hX5WpMDomylUahVYN/VlAZBwvuWdOM0h3ZUsQEPjauN0k+mY3nQVTIa0hWl1vszTddcxLZKK5mJsvlnL7HMBQxQ== dani@bitoriented.com
```

> With your mouse, highlight the entire [public key](https://en.wikipedia.org/wiki/Public-key_cryptography), beginning with `ssh-rsa` and ending with your email address. Copy the highlighted public key to the clipboard.

If you run into issues here, we will help you during orientation.

## Add the key to [GitHub](https://github.com)

> [action]
>
> 1. Click the above link, log in, and navigate to your account "Settings".
> 1. Click on SSH and GPG Keys section.
> 1. Paste your key in the 'Key' section and give it a relevant `Title`. Use an identifiable title like `Work Laptop` or `Home MacBook Pro 15`.
> 1. **Make sure you copied the entire key starting with `ssh-rsa` and ending with your email.**
> 1. Test your setup by running `ssh -T git@github.com`:

```bash
$ ssh -T git@github.com
>
Hi droxey! You have successfully authenticated, but GitHub does not provide shell access.
```

This can be complicated for first time developers. If so, have no fear - we will help you at orientation.

# Stretch Challenge: Practice Git

## Note About Stretch Challenges

You'll frequently see Stretch Challenges throughout your time at Make School. These challenges are _optional_, and are there to help give you more practice, or to dive deeper into a topic. If you want to go the extra mile and enhance your learning, we encourage you to complete them after you have completed the required content for a chapter/project/lesson/etc.

## Practice Git

Now that you have a general understanding of git, practice your skills at [Learn Git Branching](https://learngitbranching.js.org/). This is a great way to learn and practice the basics of git from the browser with a guided tutorial.

> [challenge]
>
> Complete at least the following sections from [Learn Git Branching](https://learngitbranching.js.org/):
>
> - On the `Main` tab, do the `Introduction Sequence`, parts 1-4
> - On the `Remote` tab, do Push and Pull Git Remotes, parts 1-7
> - Complete extra sections to level up your git skills even more

## Extra Resources

- [A Visual Git Reference](https://marklodato.github.io/visual-git-guide/index-en.html)
- [Learn Git in 30 Minutes Tutorial](https://tutorialzine.com/2016/06/learn-git-in-30-minutes)
- [Git-Tower.com - Learn Version Control with Git - Ebook](https://www.git-tower.com/learn/git/ebook/en/command-line/introduction)
- [Git-Tower.com - Learn Version Control with Git - Videos 1-8](https://www.git-tower.com/learn/git/videos#episodes)
