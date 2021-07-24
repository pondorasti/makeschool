# 📜 Day 6: Architecting & Implementing Token Based Applications in Node.js

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

1. [🏆 **02m**: Learning Objectives](#%F0%9F%8F%86-%2a%2a02m%2a%2a%3A-learning-objectives)
1. [🤔 **03m**: Why You Should Know This](#%F0%9F%A4%94-%2a%2a03m%2a%2a%3A-why-you-should-know-this)
1. [☀️ **20m**: Warm Up](#%E2%98%80%EF%B8%8F-%2a%2a20m%2a%2a%3A-warm-up)
1. [📖 **30m**: Overview](#%F0%9F%93%96-%2a%2a30m%2a%2a%3A-overview)
   1. [Truffle Features](#truffle-features)
   1. [Ganache Features](#ganache-features)
   1. [OpenZeppelin Features](#openzeppelin-features)
1. [**30m**: Make Progress on Tutorial](#%2a%2a30m%2a%2a%3A-make-progress-on-tutorial)
1. [📚 Resources & Credits](#%F0%9F%93%9A-resources-%26-credits)

## 🏆 **02m**: Learning Objectives

1. Analyze the full-stack ecosystem that enables the development of smart contracts and distributed applications in Node.
2. Identify and leverage existing boilerplate applications to establish a strong initial foundation in projects.
3. Begin proposing, designing, and planning your own token based coin using the Truffle framework!

## 🤔 **03m**: Why You Should Know This

Frameworks boost programmer productivity by initializing a standards-based foundation with which to develop a product.

Truffle Suite provides the scaffolding to our projects, similar to [Create React App](https://github.com/facebook/create-react-app) or [Django](https://djangoproject.com).


## ☀️ **20m**: Warm Up

Answer the warm up questions below in breakout rooms:

*You may answer the questions solo or in a pair.*

1. **Challenge 1**: What is the difference between *Ether* and *Ethereum*?
2. **Challenge 2**: What is an *unsigned integer*?
3. **Challenge 3**: What is *Natspec*? How is it used? Write out an example using an unsigned integer!

## 📖 **30m**: Overview

<p align="center"><img src="/Resources/truffle.svg" height="100"><br><a href="https://www.trufflesuite.com/docs/truffle/quickstart"><strong>🔗 Quickstart</strong></a></p>

A **world class development environment**, **testing framework**, and **asset pipeline** for blockchains using the Ethereum Virtual Machine (EVM), aiming to make life as a developer easier.

### Truffle Features

- Built-in **smart contract compilation**, **linking**, **deployment** and **binary management**.
- **Automated contract testing** for rapid development.
- **Scriptable, extensible deployment** and **migrations** framework.
- **Network management**: deploy to any number of public and private networks.
- **Package management** via `ethpm` and `npm`, using the `ERC190` standard.
- **Interactive console** for direct contract communication.
- **Configurable build pipeline** with support for tight integration.
- **External script runner** that executes scripts within a Truffle environment.

---

<p align="center"><img src="/Resources/ganache.svg" height="100"><br><a href="https://www.trufflesuite.com/docs/ganache/quickstart"><strong>🔗 Quickstart</strong></a></p>

### Ganache Features

Ganache is a **personal blockchain for Ethereum development** you can use to deploy contracts, develop your applications, and run tests.

It is available as **both a desktop application** as well as a **command-line too**l *(formerly known as the TestRPC)*.

---

<p align="center"><img src="/Resources/drizzle.svg" height="100"><br><a href="https://www.trufflesuite.com/docs/drizzle/quickstart"><strong>🔗 Quickstart</strong></a></p>

Drizzle is a **collection of front-end libraries that make writing dapp front-ends easier and more predictable**.

Takes care of synchronizing contract data, transaction data, and more. Things stay fast because you declare what to keep in sync.

---

<p align="center"><img src="/Resources/openzeppelin.png" width="400"><br><a href="https://docs.openzeppelin.org/v2.3.0/get-started"><strong>🔗 Quickstart</strong></a></p>


OpenZeppelin is a library for secure smart contract development. It provides implementations of standards like ERC20 and ERC721 which you can deploy as-is or extend to suit your needs, as well as Solidity components to build custom contracts and more complex decentralized systems.

### OpenZeppelin Features

- **Focused on Security**: Using industry standard contract security patterns and best practices, develop applications with reduced risk of vulnerabilities using standard, tested, community-reviewed code.
- **Compatibility**: Runs on any EVM-compatible blockchain.
- **Modular Approach**: Simple code, only basics. Easy collaboration and auditing.
- **Open Source**: Community driven. Used by multiple organizations and individuals.



## **30m**: Make Progress on Tutorial

Continue with the Pet Shop tutorial [here](https://www.trufflesuite.com/tutorials/pet-shop).

If you've already completed the Pet Shop tutorial, please work on the Election tutorial [here](http://www.dappuniversity.com/articles/the-ultimate-ethereum-dapp-tutorial). You can turn this in for extra credit, and the assignment is completely optional.

## 📚 Resources & Credits

- **[Truffle Documentation](https://www.trufflesuite.com/docs)**
    - [Announcing Our Fully Featured, Portable Solidity Debugger](https://www.trufflesuite.com/blog/announcing-full-portable-solidity-debugger)
    - [Variable Inspection: Going Deeper with the Truffle Solidity Debugger](https://www.trufflesuite.com/tutorials/debugger-variable-inspection)
- **[Ganache Documentation](https://www.trufflesuite.com/docs/ganache/overview)**
    - [Linking a Truffle Project](https://www.trufflesuite.com/docs/ganache/truffle-projects/linking-a-truffle-project)
- **[Drizzle Documentation](https://www.trufflesuite.com/docs/drizzle/overview)**
    - [Drizzle and Contract Events](https://www.trufflesuite.com/tutorials/drizzle-and-contract-events)
- **[OpenZeppelin Documentation](https://docs.openzeppelin.org/v2.3.0/get-started)**
    - [ERC-721 on OpenZeppelin](https://docs.openzeppelin.org/v2.3.0/api/token/erc721)
    - [OpenZeppelin on GitHub](https://github.com/OpenZeppelin/openzeppelin-solidity)
    - [OpenZeppelin Community Forum](https://forum.zeppelin.solutions/)
