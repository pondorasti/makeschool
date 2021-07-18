<!-- Run as a slideshow: reveal-md README.md -w -->
# 🐳 Your Personal PaaS

⭐️ **GOAL**: Deploy your first application on CapRover!

<!-- omit in toc -->
## ⏰ Agenda (120m)

- [[**10m**] ☀️ **Warmup**: Update CapRover Dashboard](#10m-️-warmup-update-caprover-dashboard)
- [[**10m**] 📚 **TT**: Introduction to CapRover](#10m--tt-introduction-to-caprover)
- [[**20m**] 💻 **Activity**: Feature Frenzy](#20m--activity-feature-frenzy)
- [[**15m**] 💻 **Activity**: Feature Frenzy Presentations](#15m--activity-feature-frenzy-presentations)
- [[**10m**] 🌴 **Break**](#10m--break)
- [[**20m**] 💻 **Challenge**: Deploy a Tarfile](#20m--challenge-deploy-a-tarfile)
- [[**10m**] 👍 **Review**: Deploy a Tarfile](#10m--review-deploy-a-tarfile)
- [[**20m**] 💻 **Challenge**: Deploy via CapRover CLI](#20m--challenge-deploy-via-caprover-cli)
- [[**10m**] 👍 **Review**: Deploy via CapRover CLI](#10m--review-deploy-via-caprover-cli)

<!-- > -->

<!-- omit in toc -->
## 🏆 Objectives

*By the end of this class, you'll be able to&hellip;*

1. Demonstrate a working, self-hosted platform as a service application available on a custom domain.
1. Use CapRover to deploy a web application written in Python and Flask.

<!-- > -->

## [**10m**] ☀️ **Warmup**: Update CapRover Dashboard

1. Log in to your CapRover server: `https://captain.dev.YOURDOMAIN.COM`
1. Click the `Update` link at the top left, then click `Logout`.
1. Wait 3 minutes and refresh the login page. When it appears, log in to your updated CapRover instance!

## [**10m**] 📚 **TT**: Introduction to CapRover

Walk through the features on the [CapRover] website.

The image below walks through using [CapRover] to deploy:

<p><img src="https://caprover.com/img/captain-in-one-picture.png"></p>

<!-- > -->

## [**20m**] 💻 **Activity**: Feature Frenzy

Break out into teams of 4, then write a short synopsis of the following links. In your own words:

- Explain the feature
- Describe it's options (if applicable)
- Tell us how you'd use it.

1. [Persistent Apps](https://caprover.com/docs/persistent-apps.html)
1. [CLI Commands](https://caprover.com/docs/cli-commands.html)
1. [One-Click Apps](https://caprover.com/docs/one-click-apps.html)
1. [Deployment Methods](https://caprover.com/docs/deployment-methods.html)
1. [Captain Definition File](https://caprover.com/docs/captain-definition-file.html)

Be prepared to give a 2-3 minute review of your topic to the class.

<!-- > -->

## [**15m**] 💻 **Activity**: Feature Frenzy Presentations

<!-- > -->

## [**10m**] 🌴 **Break**

<!-- > -->

## [**20m**] 💻 **Challenge**: Deploy a Tarfile

**GOAL**: Practice the most approachable deployment mechanism --- upload a tarfile on CapRover, then deploy it.

1. Visit [caprover/captain-sample-apps](https://github.com/caprover/caprover/tree/master/captain-sample-apps).
1. Choose a `.tar` file for a sample app, and download it. **Recommended**:
   - Python/Django
   - Go
   - Node
   - React
1. Go to `https://captain.dev.YOURDOMAIN.COM` in your browser.
1. From the left menu, select Apps and create a new app.
1. Name it `first-app`.
1. Go to "Deployment" tab and upload the tar file, then wait for the deployment to complete.
1. The first time you build, it'll take a few minutes. After the build is completed, visit `https://first-app.dev.YOURDOMAIN.COM`.
1. **CONGRATS! Your app is live!!** When complete, celebrate by posting the link to your working deployment on the `#bew2-2-docker` Slack channel!

<!-- > -->

## [**10m**] 👍 **Review**: Deploy a Tarfile

Go over the activity and answer any questions.

<!-- > -->

## [**20m**] 💻 **Challenge**: Deploy via CapRover CLI

**GOAL**: Practice an alternative, popular way to deploy: via CLI command.

If you get stuck, review the following guide to deploying on CapRover: [Complete Webapp Tutorial](https://caprover.com/docs/complete-webapp-tutorial.html)

1. Visit [caprover/captain-sample-apps](http://github.com/caprover/caprover/tree/master/captain-sample-apps).
1. Choose a `.tar` file for a sample app, and download it. **Recommended**:
   - Python/Django
   - Go
   - Node
   - React
1. Unzip the content by double-clicking the `.tar` file you downloaded, then open a terminal and navigate to the unzipped directory.
1. Run the deploy command below. Be sure to read carefully and follow the instructions once you execute it!

    ```sh
    caprover deploy
    ```

    Enter `second-deploy` when asked for the app name.
1. The first time you build, it’ll take a few minutes. After the build is completed, visit `second-deploy.dev.YOURDOMAIN.COM`.

## [**10m**] 👍 **Review**: Deploy via CapRover CLI

Go over the activity and answer any questions, then dismiss class.

<!-- > -->
<!-- do not edit below this line !-->
[Gradescope]: https://www.gradescope.com/courses/133579
[CapRover]: https://caprover.com
