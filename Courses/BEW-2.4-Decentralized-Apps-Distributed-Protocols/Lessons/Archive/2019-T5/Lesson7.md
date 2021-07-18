# 📜 Day 7: Test Networks

## ⏱ Agenda {docsify-ignore}

1. [🏆 [**5m**] Learning Objectives](#%F0%9F%8F%86-5m-Learning-Objectives)
2. [🏁 [**25m**] Initial Exercise](#%F0%9F%8F%81-25m-Initial-Exercise)
3. [📖 [**20m**] Overview: Test Networks](#%F0%9F%93%96-20m-Overview-Test-Networks)
4. [🌴 [**10m**] BREAK](#%F0%9F%8C%B4-10m-BREAK)
5. [💻 [**30m**] In Class Activity I](#%F0%9F%92%BB-30m-In-Class-Activity-I)
6. [📖 [**15m**] Overview: ÐApps Contractor Project](#%F0%9F%93%96-15m-Overview-%C3%90Apps-Contractor-Project)
7. [📚 Resources & Credits](#%F0%9F%93%9A-Resources--Credits)

## 🏆 [**5m**] Learning Objectives

1. Gain familiarity with UI and CLI tools that allow developers to define their own in-memory blockchain.
2. Integrate Ganache, Truffle, and Metamask to create a fully-fledged ÐApps development environment.

## 🏁 [**25m**] Initial Exercise

### Class Activity Self Check

1. Find a friend and open up your code from [last class period](Lesson6.md).
2. Use the [Solidity Style Guide](https://solidity.readthedocs.io/en/v0.5.9/style-guide.html) to assist your code review.
      1. What could be improved in your code according to this guide?
      2. Does the contract follow any [Common Patterns](https://solidity.readthedocs.io/en/v0.5.9/common-patterns.html)?
3. Write down any unanswered questions you encounter while reviewing the solution. Follow up during Jaeson or Dani's office hours!

## 📖 [**20m**] Overview: Test Networks

### Why You Should Know This

Alongside automated test cases, it’s important to run your ÐApp on a testnet before deploying it: deploying costs real money; it’s better to test on a low-stakes, "fake" network first.

### Getting Started with Test Networks

**Test networks, like Ganache, are personal blockchains for Ethereum development that run on your desktop.** Part of the Truffle Suite, Ganache simplifies ÐApp development by placing your contracts and transactions front and center. **Ganache is available for Windows, Mac and Linux, and you can [download it here](https://www.trufflesuite.com/ganache).**

Using Ganache you can **quickly see how your application affects the blockchain**, and **introspect details** like your **accounts, balances, contract creations and gas costs**. You can also fine tune Ganache's advanced mining controls to better suit your needs. It's important to know that the **currency generated as a result of this cannot be spent or exchanged**.

**Ganache, when launched, runs on `http://127.0.0.1:7545`**. It will display the first 10 accounts and the [mnemonic](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) used to create those accounts. The mnemonic will persist across restarts of Ganache, though it can be changed to be randomly generated. You can also [input your own](https://www.trufflesuite.com/docs/ganache/using).

Ganache also has a **command-line interface** for those who aren't working from a graphical environment. **Great for automated testing and continuous integration environments**, Ganache CLI runs headless and can be configured to serve all your development needs.

**Ganache CLI processes transactions instantly instead of waiting for the default block time**, so you can test that your code works quickly. It also **tells you immediately when your smart contracts run into errors**, and integrates directly with Truffle to **reduce test runtime up to 90% compared to other clients**. Learn more about [Ganache CLI](https://github.com/trufflesuite/ganache-cli/).

### Using Truffle Develop

Go over the documentation for using **[Truffle Develop and the Console]**.

## 🌴 [**10m**] BREAK

## 💻 [**30m**] In Class Activity I

### Defining a Test Blockchain for Your ÐApps Project

1. [Create a new workspace](https://www.trufflesuite.com/docs/ganache/workspaces/creating-workspaces) in Ganache for your final project.
2. [Link your project](https://www.trufflesuite.com/docs/ganache/truffle-projects/linking-a-truffle-project) to the new Ganache workspace.
3. Learn the practical applications of the [Contracts Page](https://www.trufflesuite.com/docs/ganache/truffle-projects/contracts-page), [Events Page](https://www.trufflesuite.com/docs/ganache/truffle-projects/events-page), and [Transactions Page](https://www.trufflesuite.com/docs/ganache/truffle-projects/decoded-transactions) in the Ganache UI.
4. Review the [Ganache settings](https://www.trufflesuite.com/docs/ganache/reference/ganache-settings) in order to know what to customize in the future!
5. Go through the [following tutorial](https://www.codementor.io/swader/developing-for-ethereum-getting-started-with-ganache-l6abwh62j) to reinforce your knowledge and set up MetaMask with Ganache.
6. If you finish early, continue working on your final project.

## 📖 [**15m**] Overview: ÐApps Contractor Project

Go over the following documents with the class:

- [Proposal Instructions](/Project/proposal.md)
- [Project Requirements](/Project/requirements.md)
- [Grading Rubric](/Project/rubric.md)
- [Presentation Guidelines](/Project/presentations.md)

Allow for Q&A time from students.

## 📚 Resources & Credits

- [**Truffle Develop Command Reference**](https://www.trufflesuite.com/docs/truffle/reference/truffle-commands): Describes every command available in the Truffle application.

[Truffle Develop and the Console]: https://www.trufflesuite.com/docs/truffle/getting-started/using-truffle-develop-and-the-console
