<!-- Run this slideshow via the following command: reveal-md README.md -w -->
<!-- .slide: data-background="./../Slides/images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# ⛓ Introduction to Solidity

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

1. [[**15m**] ☀️ Warm Up: DApp Developer Roadmap](#%5B%2a%2a15m%2a%2a%5D-%E2%98%80%EF%B8%8F-warm-up%3A-dapp-developer-roadmap)
1. [[**30m**] 💬 **TT**: Introduction to Solidity](#%5B%2a%2a30m%2a%2a%5D-%F0%9F%92%AC-%2a%2att%2a%2a%3A-introduction-to-solidity)
   1. [What is Solidity?](#what-is-solidity%3F)
   1. [What are Smart Contracts?](#what-are-smart-contracts%3F)
   1. [An Example Contract](#an-example-contract)
1. [[**10m**] 🌴 **BREAK**](#%5B%2a%2a10m%2a%2a%5D-%F0%9F%8C%B4-%2a%2abreak%2a%2a)
1. [[**30m**] 💻 **Demo**: Danicoin](#%5B%2a%2a30m%2a%2a%5D-%F0%9F%92%BB-%2a%2ademo%2a%2a%3A-danicoin)
1. [[**15m**] 🔄 **Introduce Homework**: Crypto Pet Shop](#%5B%2a%2a15m%2a%2a%5D-%F0%9F%94%84-%2a%2aintroduce-homework%2a%2a%3A-crypto-pet-shop)

<!-- > -->

<!-- omit in toc -->
## 🏆 Objectives

1. Review Solidity syntax with examples of two contracts.
1. Learn how to mint a sample token similar to Ether or Dogecoin.
1. Introduce the Truffle Pet Shop tutorial.

## [**15m**] ☀️ Warm Up: DApp Developer Roadmap

Review the DApps developer roadmap with students.

![DApp Developer Roadmap](https://raw.githubusercontent.com/thecryptoshed/eth-dapp-developer-roadmap/master/dapp-developer-roadmap.png)

Ask students to **identify where we are as a class on the roadmap**.What are the technologies we've learned so far? Circle each as students call them out, and use the remaining time to discuss and respond to student's answers.

## [**30m**] 💬 **TT**: Introduction to Solidity

### What is Solidity?

- Programming language for writing smart contracts on the Ethereum blockchain
- Contract-oriented language
- Runs on the Ethereum Virtual Machine (EVM)
  - Ethereum Nodes run the EVM
  - These nodes are connected to the Ethereum blockchain
- Statically typed
- Supports inheritance
- Can use third party libraries and inherit from external contracts
- Generally considered the best way to develop for the Ethereum blockchain

### What are Smart Contracts?

- The backend of an Ethereum app (`dApp` = Distributed App)
- Where all the logic lives
- Files end in `.sol`
- Allow us to execute code on the Ethereum blockchain
- Think of it like a microservice or mini API out on the web
- Anyone can see the code for our smart contracts
- Anyone connected to the network can call functions on our smart contracts

### An Example Contract

```
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}
```

**Let's break it down line by line!**

- **Line 01**: The first line tells us that the source code is written for Solidity version `0.4.16`, or a newer version of the language up to, but not including version` 0.9.0`.
  - The `pragma` keyword is used to enable certain compiler features or checks.
  - The first line is an example of a **version pragma**.
  - You have to add the pragma to all your files if you want to enable it in your whole project.
  - **Question**: Why do you think specifying a minimum and maximum version might be important?
- **Line 03**: Defines a Smart Contract --- a collection of code (_functions_) and data (_state_) that resides at a specific address on the Ethereum blockchain.
- **Line 04**: Delares a state variable called `storedData` of type `uint` _(unsigned integer of 256 bits)_
  - Like a single slot in a database you can query / alter by calling functions of the code that manages the database
- **Lines 06 - 12**:  The contract defines the functions `set` and `get` that can be used to modify or retrieve the value of the `storedData` variable.
    - **Question**: If this contract existed on the blockchain, who would be able to call the `set` function?

<!-- > -->

## [**10m**] 🌴 **BREAK**

<!-- > -->

## [**30m**] 💻 **Demo**: Danicoin

The following contract demonstrates how to develop a simple ERC-20 token contract similar to Ethereum, Dogecoin, etc. There's some new stuff in here that we haven't talked about yet, so **let's break this one down line by line, too!**

```
contract Coin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;

    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
```

<!-- > -->

## [**15m**] 🔄 **Introduce Homework**: Crypto Pet Shop

Let's learn how to develop these contracts on our own machines using the [Crypto Pet Shop Tutorial](https://www.trufflesuite.com/guides/pet-shop.html)!

Our asyncronous classwork this week will have you complete another tutorial that gets you familiar with the tools and framework we'll use in the remainder of the course.

The instructor should walk through the tutorial step by step and answer any questions that may arise.

We'll be learning lots more about truffle next class period, and continue working our way through the roadmap!

<!-- > -->

<!-- omit in toc -->
## 📚 Resources & Credits

- [Solidity for Beginners · Smart Contract Development Crash Course | Dapp University](https://www.dappuniversity.com/articles/solidity-tutorial)
- [Solidity documentation](https://docs.soliditylang.org/en/v0.8.6/)
