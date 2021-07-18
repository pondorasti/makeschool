<!-- Run this slideshow via the following command: reveal-md README.md -w -->
<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# ⛓ More Ways to Write Contracts

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

- [[**30m**] :computer: **Activity**: Write Contract in Solidity](#30m-%f0%9f%92%bb-activity-write-contract-in-solidity)
- [[**30m**] :eyes: **Watch**: Rewrite 4 Solidity Smart Contracts in Vyper](#30m-%f0%9f%91%80-watch-rewrite-4-solidity-smart-contracts-in-vyper)
- [[**20m**] :computer: **Activity**: Write Contract in Vyper](#20m-%f0%9f%92%bb-activity-write-contract-in-vyper)
- [[**15m**] :palm_tree: **BREAK** {docsify-ignore}](#15m-%f0%9f%8c%b4-break-docsify-ignore)

<!-- > -->

<!-- omit in toc -->
<!-- ## 🏆 Objectives -->

<!-- TODO: Objectives -->
<!-- |   Level   | Verbs |
     | --------- | ----- |
     | 6: Create | design, formulate, build, invent, create, compose, generate, derive, modify, develop |
     | 5: Evaluate | choose, support, relate, determine, defend, compare, contrast, justify, support, convince, select |
     | 4: Analyze | classify, break down, categorize, analyze, diagram, illustrate, criticize, simplify, associate |
     | 3: Apply | calculate, predict, apply, solve, illustrate, use, demonstrate, determine, model, perform, present |
     | 2: Understand | describe, explain, paraphrase, restate, summarize, contrast, interpret, discuss |
     | 1: Remember | list, recite, outline, define, name, match, quote, recall, identify, label, recognize | -->

<!-- > -->

## [**30m**] :computer: **Activity**: Write Contract in Solidity

### Do This First

1. **In the `token` project created on Day 7, rename the provided `Token.sol` file to `ERC20.sol`.**
1. **Create a new `Token.sol` file, and complete the challenges below**:

### Challenges

1. Add a **variable** named `total`. Everyone should be able to access it.
1. Add an **event** named `AddToTotalEvent`.
1. Add and implement a **function** named `addToTotal` with a single **argument** named `number`.
      1. Adds `number` to `total`.
      1. Triggers `AddToTotalEvent`.
1. Make sure it compiles!
1. Turn it in on [Gradescope](https://www.gradescope.com/courses/160564/assignments/682184)

## [**25m**] :eyes: **Watch**: Rewrite 4 Solidity Smart Contracts in Vyper

<p align="center">
    <iframe title="YouTube: Rewrite 4 Solidity Smart Contracts in Vyper" width="692" height="389" src="https://www.youtube.com/embed/NwSIaNhRHFQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</p>

## [**20m**] :computer: **Activity**: Write Contract in Vyper

### Repeat Challenges

1. Repeat the instructions [above](#challenges), but implement the contract using Vyper instead of Solidity.
1. Turn it in on [Gradescope](https://www.gradescope.com/courses/160564/assignments/682184)

<!-- ## [**20m**] :speech_balloon: **TT**: Topic -->

<!-- > -->

<!-- ## [**10m**] :arrows_counterclockwise: **Recap**: Today's Takeaways -->

<!-- TODO: Write takeaways -->

<!-- > -->

<!-- omit in toc -->

## 📚 Resources & Credits

- [Solidity Inheritance and Deploying an Ethereum Smart Contract](https://coursetro.com/posts/code/103/Solidity-Inheritance-and-Deploying-an-Ethereum-Smart-Contract)

- [bkrem/awesome-solidity: A curated list of awesome Solidity resources, libraries, tools and more](https://github.com/bkrem/awesome-solidity)
- [r/ethdev](https://www.reddit.com/r/ethdev/)
- [ethereum/dapp-bin: A place for all the ÐApps to live](https://github.com/ethereum/dapp-bin)
- [The Top 137 Smart Contracts Open Source Projects](https://awesomeopensource.com/projects/smart-contracts)
- [Vyper Full Stack dApp Tutorial Series - Kauri](https://kauri.io/vyper-full-stack-dapp-tutorial-series/5d68cd3db93cd40001f1cb36/c)
- [Understanding Smart Contract Compilation And Deployment - Kauri](https://kauri.io/understanding-smart-contract-compilation-and-deplo/195c5784663e4963b16d914900ba5cf5/a)
- [solidity-workshop/2016-02-17-solidity-systems-I.md](https://github.com/androlo/solidity-workshop/blob/master/tutorials/2016-02-17-solidity-systems-I.md#accounts-code-and-storage)
- [solidity-workshop/2016-03-09-advanced-solidity-I.md](https://github.com/androlo/solidity-workshop/blob/master/tutorials/2016-03-09-advanced-solidity-I.md)
