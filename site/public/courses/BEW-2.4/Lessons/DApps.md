<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# ⛓ Introduction to DApps

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

- [[**10m**] ☀️ Warm Up: Make Sure Environment is Set Up](#10m-%e2%98%80%ef%b8%8f-warm-up-make-sure-environment-is-set-up)
- [[**20m**] 💻 Activity: Smart Contracts vs DApps](#20m-%f0%9f%92%bb-activity-smart-contracts-vs-dapps)
- [[**10m**] 💬  Discuss: Smart Contracts vs DApps](#10m-%f0%9f%92%ac-discuss-smart-contracts-vs-dapps)
- [[**20m**] 💻 Activity: Architecture Distributions](#20m-%f0%9f%92%bb-activity-architecture-distributions)
- [[**30m**] 📚 TT: DApps Overview](#30m-%f0%9f%93%9a-tt-dapps-overview)
- [[**10m**] 💻 Activity: Actualizing Advantages](#10m-%f0%9f%92%bb-activity-actualizing-advantages)
- [[**10m**] 📚 TT: DApp Advantages](#10m-%f0%9f%93%9a-tt-dapp-advantages)
- [[**05m**] 📚 TT: Architecture Diagram](#05m-%f0%9f%93%9a-tt-architecture-diagram)
- [[**05m**] 🌃 Wrap Up: Takeaways](#05m-%f0%9f%8c%83-wrap-up-takeaways)
- [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

<!-- > -->

<!-- ## [**00m**] 🏆 Objectives -->

<!-- |   Level   | Verbs |
| --------- | ----- |
| 6: Create | design, formulate, build, invent, create, compose, generate, derive, modify, develop |
| 5: Evaluate | choose, support, relate, determine, defend, compare, contrast, justify, support, convince, select |
| 4: Analyze | classify, break down, categorize, analyze, diagram, illustrate, criticize, simplify, associate |
| 3: Apply | calculate, predict, apply, solve, illustrate, use, demonstrate, determine, model, perform, present |
| 2: Understand | describe, explain, paraphrase, restate, summarize, contrast, interpret, discuss |
| 1: Remember | list, recite, outline, define, name, match, quote, recall, identify, label, recognize | -->

<!-- > -->


## [**10m**] ☀️ Warm Up: Make Sure Environment is Set Up

In breakout rooms, double check that both you and your partner can successfully run `brownie compile` and `brownie run token` commands in the starter project from [last class](SmartContracts.md).

## [**20m**]  💻 Activity: Smart Contracts vs DApps

Watch [Difference between DApps and Smart Contracts? Programmer explains.
](https://www.youtube.com/watch?v=4rczD8xKPJc) and answer the following questions:

1. In your notebook, **list everything you know** about **Smart Contracts** and **DApps**.
1. How are the two terms **similar**?
1. How are they **different**?

**When you're done, post your list on Slack in the `#bew2-4-dapps` channel.**

## [**10m**] 💬  Discuss: Smart Contracts vs DApps

Ask students to share answers and discuss.

## [**20m**] 💻 Activity: Architecture Distributions

Most projects require the following categories in order to be considered full stack applications:

1. Backend
1. Frontend
1. Data storage
1. Inter-process messaging
1. Name resolution

**Each** could be somewhat centralized or somewhat decentralized.

### Examples

- a frontend web app that runs on a centralized server, or a mobile app
- backend and data storage on private servers / proprietary databases, or you could use a smart contract and P2P storage

### Challenges

Discuss the answers to the following challenge questions in breakout rooms:

- Which of these categories are **commonly _decentralized_**?
- For each category, provide at least one example of each that occurs in real life...
    -  a _centralized_ example
    -  a _decentralized_ example


**When you're done, post your list on Slack in the `#bew2-4-dapps` channel.**

<!-- > -->

## [**30m**] 📚 TT: DApps Overview

### History

> [!NOTE]
> Web 2.0 began when Web users started to drastically change the way they were using the Web on a day-to-day basis. The main trends that shaped Web 2.0 include content sharing, creativity, segmentation, social components, and a large move from static web sites and tools to more dynamic ones.

The creators of Ethereum had a grand vision --- one beyond smart contracts. They wanted to **invent a new web full of decentralized applications**, and **named this concept `web3`**.

### Key Terms

- **Smart Contracts** are a way to decentralize the controlling logic and payment functions of applications.
- **Web3 DApps**: are web applications that are mostly or completely decentralized. They decentralize all other aspects of an application: storage, messaging, naming, etc using smart contracts on the backend.

<!-- > -->

## [**10m**] 💻 Activity: Actualizing Advantages

Give examples of when a programmer might be interested in developing an application that is...

- **Resilient**
- **Transparent**
- **Censorship Resistant**

## [**10m**] 📚 TT: DApp Advantages

DApps provide several advantages over traditional centralized architectures.

### Resiliency

Because the business logic is controlled by a smart contract, a DApp backend will be fully distributed and managed on a blockchain platform.

Unlike an application deployed on a centralized server, a DApp will have no downtime and will continue to be available as long as the platform is still operating.

### Transparency

The on-chain nature of a DApp allows everyone to inspect the code and be more sure about its function. Any interaction with the DApp will be stored forever in the blockchain.

### Censorship Resistance

As long as a user can access or run a node on the Ethereum network, they can use DApps without interference from any centralized control.

**No service provider, or even the owner of the smart contract, can alter the code once it is deployed on the network.**

<!-- > -->


## [**05m**] 📚 TT: Architecture Diagram

![architecture](Assets/DApp_Architecture.png)

## [**05m**] 🌃 Wrap Up: Takeaways

- DApps are the **culmination of the Ethereum vision**; explored in the earliest design phases of Ethereum.
- Many apps call themselves “DApps” today --- _**most are NOT 100% decentralized**_.
- **Today**, it's 100% possible to write applications that are nearly entirely decentralized.
- **In the future**, as the technology matures further, more and more of our applications can be decentralized, resulting in a more resilient, censorship-resistant, and free web.

<!-- > -->

## 📚 Resources & Credits

### Books

- **Mastering Ethereum**: _Building Smart Contracts and DApps_; Andreas M. Antonopoulos. _Published 2019_.

