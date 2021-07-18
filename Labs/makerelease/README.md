# ☕️ makerelease

Use this repository to build a macOS (x64) compatible binary, then release it on both GitHub and [Homebrew](https://brew.sh).

## Prerequisites

Install the `goreleaser` command by running:

```bash
$ brew install goreleaser/tap/goreleaser
Updating Homebrew...
```

## Use in Existing Projects

❗️If it's **your first time releasing a Go application on Homebrew**, you are **strongly encouraged** to **fully complete the [Step by Step Guide](#step-by-step-guide) as written.** You'll gain the experience required to release your own Go programs on Homebrew.

1. In the root of your Go project, run the following command to copy the `.goreleeaser.yml` file to the root of your repo:

   ```bash
   curl https://raw.githubusercontent.com/Make-School-Labs/makerelease/master/.goreleaser.yml > .goreleaser.yml
   ```

2. Follow the **[Step by Step Guide](#step-by-step-guide)** below, **replacing `hellohomebrew` with the name of your project.**

## Step by Step Guide

> *This quick start guide is based on the guide found on GoReleaser.com, modified for brevity and relevance to [BEW 2.5](https://make.sc/bew2.5).*

### Step 1: Repository Setup

1. Create a [new GitHub repository](https://github.com/new) named `homebrew-hellohomebrew` **exactly**.

2. *(Skip for Existing Projects)*<br>[Import a GitHub repository](https://github.com/new/import) and match this screenshot **exactly**:

   <p align="center"><img src="import.png" width="550"></p>

3. **[Create a valid GitHub token](https://github.com/settings/tokens/new)** with the `repo` scope. It will be used to deploy releases to your GitHub repository on your behalf. **Save the token in a safe place. You'll need it later.**

   <p align="center"><img src="token.png" width="600"></p>

4. Open your terminal and follow the steps below.

### Step 2: In Your Terminal

1. Clone your repository locally and `cd hellohomebrew`:

   ```bash
   $ git clone https://github.com/GITHUB_USERNAME/hellohomebrew
   ```

2. Create a new module by running:

   ```bash
   $ go mod init github.com/GITHUB_USERNAME/hellohomebrew
   ```

3. Open `.goreleaser.yml` and change `GITHUB_USERNAME` to your GitHub username.

4. GoReleaser will use the latest [Git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) of your repository. Create a tag and push it to GitHub:

   ```bash
   $ git tag -a v1.0.0 -m "First release"
   $ git push origin v1.0.0
   ```

5. Test GoReleaser before doing a real release.
   This command only builds and packages your code:

   ```bash
   $ goreleaser release --skip-publish --rm-dist --snapshot
   ```

6. If it worked, run GoReleaser at the root of your repository:

   ```bash
   $ export GITHUB_TOKEN=YOUR_GITHUB_TOKEN
   $ goreleaser release --rm-dist
   ```

### Step 3: Install and Test

1. Install your program from Homebrew:

   ```bash
   $ brew install GITHUB_USERNAME/hellohomebrew/hellohomebrew
   ```

2. Time to see if it works! Run the command to test:

   ```bash
   $ hellohomebrew
   🍺   Hello from Homebrew!   🍺
   ```
