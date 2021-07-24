<!-- Run this slideshow via the following command: reveal-md README.md -w -->
<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# 🤖 Awesome Automations

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda

1. [[**05m**] 🏆 Learning Outcomes](#%5B%2a%2a05m%2a%2a%5D-%F0%9F%8F%86-learning-outcomes)
1. [[**15m**] ☀️ **Warmup**: Reading, Writing, & Rainbows](#%5B%2a%2a15m%2a%2a%5D-%E2%98%80%EF%B8%8F-%2a%2awarmup%2a%2a%3A-reading%2C-writing%2C-%26-rainbows)
1. [[**25m**] 💬 **TT**: General Guidelines for Modules](#%5B%2a%2a25m%2a%2a%5D-%F0%9F%92%AC-%2a%2att%2a%2a%3A-general-guidelines-for-modules)
1. [[**30m**] 💻 **Activity**: Find Free Functions Fast](#%5B%2a%2a30m%2a%2a%5D-%F0%9F%92%BB-%2a%2aactivity%2a%2a%3A-find-free-functions-fast)
1. [[**15m**] 🌴 **BREAK**](#%5B%2a%2a15m%2a%2a%5D-%F0%9F%8C%B4-%2a%2abreak%2a%2a)
1. [[**10m**] 🤔 **Brainstorm**: Modules + CLI = Automation](#%5B%2a%2a10m%2a%2a%5D-%F0%9F%A4%94-%2a%2abrainstorm%2a%2a%3A-modules-%2B-cli-%3D-automation)
1. [[**60m**] 💻 **Lab Time**: Node Module Challenge](#%5B%2a%2a60m%2a%2a%5D-%F0%9F%92%BB-%2a%2alab-time%2a%2a%3A-node-module-challenge)
1. [[**10m**] 🔄 **Recap**: Today's Takeaways](#%5B%2a%2a10m%2a%2a%5D-%F0%9F%94%84-%2a%2arecap%2a%2a%3A-today%27s-takeaways)

<!-- > -->

## [**05m**] 🏆 Learning Outcomes

By the end of this lesson, you should be able to...

1. Illustrate numerous use cases for third-party Node modules that can enhance our codebase.
1. Describe the qualities of a well-written Node module.
1. Write code that enables simple integrations, automations, or visualizations from the command line.

<!-- > -->

## [**15m**] ☀️ **Warmup**: Reading, Writing, & Rainbows

<img src="https://camo.githubusercontent.com/7992a33018c650837a1089c505eb0c2e8178df9478bc77fd2d61f80bf0de2443/687474703a2f2f6269742e6c792f6772616469656e742d737472696e672d70726576696577">

⭐️ **GOAL**: Use the provided [documentation](https://github.com/bokub/gradient-string) to create beautiful terminal output. **_How creative can you get_?**

1. Read over the documentation for the `gradient-string` package [here](https://github.com/bokub/gradient-string).
1. Create a **new node project** for today's experiments.
   1. Make a new directory.
   1. Run `npm init` inside.
1. In your new project, create a file named `index.js`.
1. Implement `gradient-string` on any string you choose.
   - I recommend a [quote about programming](https://droxey.com/docs/#/meta/quotes-programming)!
1. When we come back from breakouts, **take a screenshot of your terminal** (`Command` + `Shift` + `4`).
1. **Upload the screenshot to Slack in `#bew2-1-web-patterns`** to earn credit for participating.

<!-- > -->

## [**25m**] 💬 **TT**: General Guidelines for Modules

I selected `gradient-string` for our warmup exercise because...

- The library is a great example of an MVP you can implement for your final challenge!
- The module is responsible for doing one thing --- and _ONLY_ one thing --- well.
- The implementation follows the best practices we're about to highlight below.

### Best Practices

Like atoms or DNA, modules are the basic building blocks of your application. They enforce basic modularity while remaining flexible enough to fit almost anywhere. What you choose to build with them is up to you, but the following guidelines will help get you pointed in the right direction.

- **Build Small Modules**: build modules to serve a single purpose Building small, single-purpose modules is at the heart of the Node.js philosophy. Borrowing from Unix, Node.js encourages composing the complex and powerful out of smaller, simpler pieces. This idea trickles down from entire applications (using the best tool for the job vs. a full suite) to how the tools themselves are built.

  The developers behind the popular Express web framework improved their focus and speed by pulling out most middleware features into separate modules. Instead of loading Express to get a full functioning framework, you load "express core" and then individually install each of the different middleware you'd like to use. Each middleware is now allowed to develop independently, while the consumer can swap at will (see "Use the best tool for the job" above). Everyone wins.

- **... But Don't Get Carried Away**: Modularity is a powerful concept, but like anything else its easy to get carried away. Just because every little helper function and object can be its own module, doesn't mean it necessarily should. Separating your code doesn't necessarily reduce complexity, but it does shard it.

  **Only build modules as needed**. If there is a tangible benefit to splitting code off into a new module (ex: someone else might like to use it, this will make my code cleaner, etc) then by all means go ahead. Just remember: the end-goal is always simpler code, and not just a greater number of smaller files.

- **Write Modules For Others To Read / Build Modules For Others To Use**: With so many different module, it's impossible to ignore the community. Instead of just writing code for yourself or your team, published modules will be shared across the world. Pay it forward by building with the clueless stranger in mind. Make your interface straight-forward and simple. Keep odd side effects to a minimum. and most importantly: document everything. Doing this will save everyone -- including yourself -- time and energy when working with dependencies.

> 🔗 <small>[**source**: http://thenodeway.io](http://thenodeway.io) </small>

<!-- > -->

## [**30m**] 💻 **Activity**: Find Free Functions Fast

⭐️ **GOAL**: Jumpstart your project by finding examples of modules that follow the guidelines discussed above.

1. For at least 5 to 10 minutes, **browse the links provided below** together as a group. Call out any interesting packages you find!
     - 1️⃣ [**parro-it/awesome-micro-npm-packages**: A curated list of small, focused npm packages.](https://github.com/parro-it/awesome-micro-npm-packages)
     - 2️⃣ [**bnb/awesome-awesome-nodejs**: 🐢🚀 An Awesome list of Awesome lists related to Node.js.](https://github.com/bnb/awesome-awesome-nodejs)
     - 3️⃣ [**sindresorhus/awesome-nodejs**: Delightful Node.js packages and resources](https://github.com/sindresorhus/awesome-nodejs)
     - 4️⃣ [**sindresorhus/awesome-npm**: Awesome npm resources and tips](https://github.com/sindresorhus/awesome-npm)
1. Find a package that **meets all the guidelines we discussed in class today**.
1. Work together with your team to create a **tiny code sample** that uses the selected package.
    - This activity is all about exploration, inspiration, and reading documentation.
    - It's okay if the code is minimal!  Use today's warmup as a guide.
1. When the group is finished, **copy and paste the following message** in our Slack channel:

    ```txt
    - Package: REPLACE_WITH_PACKAGE_NAME
    - Install: `npm install REPLACE_WITH_PACKAGE_NAME`
    - Code Sample:

      PASTE_CODE_HERE
    ```

<!-- > -->

## [**15m**] 🌴 **BREAK**

<!-- > -->

## [**10m**] 🤔 **Brainstorm**: Modules + CLI = Automation

⭐️ **GOAL**: Gain insight on solving a problem or completing a task using the modules we discovered before break.

1. In breakouts, review the list of modules posted in Slack from our last activity.
1. Select any module posted and start / continue the thread for that post.
1. Invent a use case for the module and post it in the thread.

<!-- > -->

## [**60m**] 💻 **Lab Time**: Node Module Challenge

<!-- > -->

## [**10m**] 🔄 **Recap**: Today's Takeaways

1. There's _way_ more to Node than just Express!
1. Many developers use Node to write CLI commands instead of websites.
1. Node enables interactivity through a multitude of third-party modules on NPM.
1. Check out the Resources & Credits section below to learn even more about modules.

<!-- omit in toc -->
## 📚 Resources & Credits

- [The Node Way - Introduction: What is The Node Way?](http://thenodeway.io/introduction/#build-small-single-purpose-modules)
- [The Node Way - Dangerous Module Design Patterns](http://thenodeway.io/posts/dangerous-module-design-patterns/)
- [DailyJs: How I Automated My Job With Node.js](https://medium.com/dailyjs/how-i-automated-my-job-with-node-js-94bf4e423017)
- [Learn How to Build CLI Automation Tools with NodeJS](https://livecodestream.dev/post/learn-how-to-build-cli-automation-tools-with-nodejs/)
- [12 Things You're Doing Every Day that Can Be Automated - Focus](https://www.meistertask.com/blog/12-things-youre-doing-every-day-that-can-be-automated/)
- [Javascript at the command-line (Creative Coding)](https://creative-coding.decontextualize.com/node/)
