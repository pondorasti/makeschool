# ⛓ Deploying Smart Contracts

<!-- > -->

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

- [[**02m**] 🏆 Objectives](#02m-%f0%9f%8f%86-objectives)
- [[**03m**] 🤔 Why You Should Know This](#03m-%f0%9f%a4%94-why-you-should-know-this)
- [[**20m**] ☀️ Warm Up: Set Up Testnet Access](#20m-%e2%98%80%ef%b8%8f-warm-up-set-up-testnet-access)
- [[**30m**] 📖 Overview: Test Networks](#30m-%f0%9f%93%96-overview-test-networks)
- [[**20m**] 💻 Activity: Get Gas Money](#20m-%f0%9f%92%bb-activity-get-gas-money)
- [[**15m**] 🌴 BREAK](#15m-%f0%9f%8c%b4-break)
- [[**25m**] 💻 Activity: Import Account to Brownie](#25m-%f0%9f%92%bb-activity-import-account-to-brownie)
- [[**30m**] 📖 Overview: Deployment](#30m-%f0%9f%93%96-overview-deployment)
- [[**35m**] Activity: Deployment Challenges](#35m-activity-deployment-challenges)
- [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

<!-- > -->

## [**02m**] 🏆 Objectives

1. Describe the process required to obtain test Ether in order to deploy a Smart Contract on a test network.
1. Identify the different test networks and the use cases for each.
1. Deploy a Smart Contract to a test network.

<!-- > -->

## [**03m**] 🤔 Why You Should Know This

Alongside automated test cases, it’s **important to run your ÐApp on a test network before deploying it to Mainnet**: Mainnet deployment costs real money; it’s better to test on a low-stakes, "fake" network first.

<!-- > -->


## [**20m**] ☀️ Warm Up: Set Up Testnet Access

> [!NOTE]
> **What is Infura?**
> Infura provides tools and infrastructure that make it quick, easy, and cost-effective for developers to connect to Ethereum and IPFS and start building awesome decentralized applications. No syncing required. No complex set-ups. Just your decentralized app, live and functioning, right now.

### Instructions

1. Sign up for [Infura](https://infura.io).
1. Create a new project (name it anything you want --- you can delete it later).
1. Find the project ID and write it down in your notes for use later on in today's activities.
1. Use the video below if you get stuck:

    <iframe width="560" src="https://www.youtube.com/embed/z-lRuKBimW8" frameborder="0" allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [**30m**] 📖 Overview: Test Networks

**Testnets are copies of the Ethereum blockchain almost identical in every way to Mainnet --- _except in the fact that their Ether is worthless_**.

In addition to mainnet, there are public testnets. These are networks used by protocol developers or smart contract developers to test both protocol upgrades as well as potential smart contracts in a production-like environment before deployment to mainnet. Think of this as an analog to production versus staging servers.

It’s generally important to test any contract code you write on a testnet before deploying to the mainnet. If you're building a dapp that integrates with existing smart contracts, most projects have copies deployed to testnets that you can interact with.

Most testnets use a proof-of-authority consensus mechanism. This means a small number of nodes are chosen to validate transactions and create new blocks – staking their identity in the process. It's hard to incentivize mining on a proof-of-work testnet which can leave it vulnerable.

<!-- > -->

### Existing Test Networks

#### Mainnet

Mainnet is the primary public Ethereum production blockchain, where actual\-value transactions occur on the distributed ledger.

When people and exchanges discuss ETH prices, they're talking about mainnet ETH.

<!-- > -->

#### Ropsten

- Last public proof-of-work testnet
- Last testnet that is available across different client implementations
- Specifications closest to the Ethereum main network
- **Kept alive to test contracts and DApps before they are deployed to mainnet**

<!-- > -->

#### Rinkeby

- Second proof-of-authority network
- Also launched in response to the Ropsten spam attacks
- However, instead of Aura, it's using Geth's *Clique* proof-of-authority engine [which differs in its specification](https://github.com/ethereum/EIPs/issues/225).

<!-- > -->

#### Görli

- Blockchain explorer: https://goerli.etherscan.io/
- What is Görli? https://github.com/goerli/testnet
- Why Görli? https://ethereum.stackexchange.com/questions/69592/87
- Why not Ropsten? https://youtu.be/uzGEmO7H5aU?t=295

<!-- > -->

## [**20m**] 💻 Activity: Get Gas Money

This [Ether faucet](https://faucet.rinkeby.io) is running on the Rinkeby network. To prevent malicious actors from exhausting all available funds or accumulating enough Ether to mount long running spam attacks, requests are tied to common 3rd party social network accounts. Anyone having a Twitter or Facebook account may request funds within the permitted limits.

### Instructions

- First, copy your Ethereum address from MetaMask.
- To request funds via **Twitter**:
  - Make a [tweet](https://twitter.com/intent/tweet?text=Requesting%20faucet%20funds%20into%200x0000000000000000000000000000000000000000%20on%20the%20%23Rinkeby%20%23Ethereum%20test%20network.) with your MetaMask Ethereum address pasted into the contents (surrounding text doesn't matter).
  - Copy-paste the tweet URL into the input box at the top and press `Give Me Ether`.
- To request funds via **Facebook**:
  - Publish a new **public** post with your MetaMask Ethereum address embedded into the content (surrounding text doesn't matter).
  - Copy-paste the post URL into the input box at the top and press `Give Me Ether`.

<!-- > -->

## [**15m**] 🌴 BREAK

<!-- > -->

## [**25m**] 💻 Activity: Import Account to Brownie

### Import Instructions

1. **Copy your private key in MetaMask**:
   - Click `Triple Dots` in header > Click `Account Details` in dropdown > Click `Export Private Key` button.
   - **Copy private key** to clipboard.
   - **Open your Terminal**.
1. Run the following command to **import your MetaMask account**:

    ```bash
    $ brownie accounts new metamask
    Brownie v1.11.3 - Python development framework for Ethereum

    Enter the private key you wish to add: PASTE METAMASK PRIVATE KEY HERE
    Enter the password to encrypt this account with: PASTE METAMASK PASSWORD HERE
    SUCCESS: A new account '0xe4233b38fEa3B8c27ea9F54d5A90ec27cEe7F42C' has been generated with the id 'metamask'
    ```

1. You will be asked to input the private key --- paste it and hit <ENTER>.
1. You will be asked to input a password --- paste the same password you use for MetaMask, and hit <ENTER>.
1. The account will then be available as `metamask`.

### Discussion

Why do you think we imported an existing account instead of creating a new one?

<!-- > -->



## [**30m**] 📖 Overview: Deployment

1. If missing inside the `contracts` folder, add `Token.sol` to the project again: [code here](https://gist.github.com/droxey/b7764944b39973fbe4f5275e4bb5b584).
1. Select a testnet. In class, we'll use **Rinkeby** --- where we just received funds from the faucet.
1. **Export `WEB3_INFURA_PROJECT_ID`** for use by Brownie. Replace `YOUR_PROJECT_ID` with the one you copied during today's warmup:

    ```bash
    $ export WEB3_INFURA_PROJECT_ID=YOUR_PROJECT_ID
    ```

1. **Test the console** using the Rinkeby network:

    ```bash
    $ brownie console --network rinkeby
    ```

## [**35m**] Activity: Deployment Challenges

1. Using the Brownie console, **find your account and print out the balance**.

    🤔 **HINT**: Use [**`Accounts.load()`**](https://eth-brownie.readthedocs.io/en/stable/api-network.html#Accounts.load)!

1. Using the code you just wrote, change the deployment script in `deploy/token.py`: to load your account, then use it to deploy the contract.
1. Run `brownie run token --network rinkeby` to **deploy** and see if your modifications worked!

    :green_circle: If you receive output like this, it worked!

    ```bash
    $ Brownie v1.11.3 - Python development framework for Ethereum

   TokenProject is the active project.
   Enter the password to unlock this account:

   Running 'scripts/token.py::main'...
   Transaction sent: 0xea1ff5050a8ab83069d643a1c147753578f5be1267130dc1eab81e84c085cccf
     Gas price: 1.0 gwei   Gas limit: 568012
   Waiting for confirmation...
     Token.constructor confirmed - Block: 7243486   Gas used: 516375 (90.91%)
     Token deployed at: 0x7E1c0953A72659DD64d05f98dA302D93491E3601
    ```

    :red_circle: **If you receive an error like below, keep working on the code**. You haven't loaded an account successfully yet!

    ```bash
        File "brownie/network/account.py", line 101, in __getitem__
          return self._accounts[key]
      IndexError: list index out of range
   ```

<!-- > -->

## 📚 Resources & Credits

### Infura

- [Frequently Asked Questions | Infura](https://infura.io/faq)

### Test Networks

- [The Görli Testnet Proposal - A Call for Participation. - DEV](https://dev.to/5chdn/the-grli-testnet-proposal---a-call-for-participation-58pf)
- [The many ways of testing Smart Contracts in Ethereum – INNOQ](https://www.innoq.com/en/blog/testing-ethereum/)
- [Networks | ethereum.org](https://ethereum.org/en/developers/docs/networks/)

### Brownie Docs

- [Deployment Basics — Brownie 1.10.4 documentation](https://eth-brownie.readthedocs.io/en/stable/deploy.html)
- [Network Management — Brownie 1.10.4 documentation](https://eth-brownie.readthedocs.io/en/stable/network-management.html)
- [Account Management — Brownie 1.10.4 documentation](https://eth-brownie.readthedocs.io/en/stable/account-management.html)
