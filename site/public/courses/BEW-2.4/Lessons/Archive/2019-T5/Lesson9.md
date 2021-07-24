# 📜 Day 9: Deployments via Truffle

## ⏱ Agenda

- [⏱ Agenda](#%e2%8f%b1-agenda)
- [🏆 [5m] Learning Objectives](#%f0%9f%8f%86-5m-learning-objectives)
- [📖 [15m] Overview](#%f0%9f%93%96-15m-overview)
- [💻 [60m] In Class Activity](#%f0%9f%92%bb-60m-in-class-activity)
- [🌴 [10m] BREAK](#%f0%9f%8c%b4-10m-break)
- [📖 [20m] Code Walkthrough](#%f0%9f%93%96-20m-code-walkthrough)
- [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)

## 🏆 [5m] Learning Objectives

1. Identify and describe the process required to obtain test Ether in order to deploy a Smart Contract on the Rinkeby network.
2. Deploy a Smart Contract to the Rinkeby test network.
3. Build a instant, customizable marketplace for your Smart Contract's items, collectibles, or other `ERC721` assets.

## 📖 [15m] Overview

Today's class connects several topics discussed during our course, including:

- Deploying a Smart Contract to a test network.
- Using MetaMask to interface with a test network.
- Using a Faucet to receive testnet Ether.
- Using a deployed Smart Contract in to facilitate distribution through a popular ÐApps marketplace called [OpenSea].

### Why You Should Know This

OpenSea provides a powerful marketplace for your ÐApp, allowing your items to be bought and sold quickly and easily. It allows you to focus on design, content and your users, while still having a full-featured marketplace for your project's digital assets.

#### Supports Any Asset Type

We'll support any asset type, as long as it's on the blockchain. Check out the [Dottabot Software License] project, as well as [Digital Art Chain] for a couple examples of non-game projects.

#### Customization

Your OpenSea storefront can be tailored exactly to your project, creating a fully customizable landing page and marketplace. If you're looking for even more customization that the native OpenSea marketplace, you can explore our white-label solution, as well as our OpenSea SDK for creating auctions directly inside your application.

#### Liquidity & Discoverability

Thousands of users already use OpenSea to discover, purchase, and sell rare digital items. By listing your game on OpenSea, you'll open up your items to a large user base of gamers, traders, and crypto enthusiasts. This increases both the liquidity of your items and the discoverability of your app.

#### Initial Item Sales

In addition to peer-to-peer trading, OpenSea can be used as a tool for the initial sale of your gaming items.

## 💻 [60m] In Class Activity

Break students into [random groups of 2 to 3](https://www.randomlists.com/team-generator?items=Ali%0AAnsel%0AVincenzo%0AJamie%0ADrew%0ARyan%0AEdwin%0AJaeson%0AMakhmud%0ANolan%0AZurich%0AIkey%0AThomas%0AJayce%0ARaymond&grp=7).

### Challenge

**Complete parts 1 through 7 of the [OpenSea Developer Tutorial]**. _Step 6 is optional, which requires deployment to the main Ethereum network._

### Prerequisites

You'll need the following packages installed to complete today's in class activity:

- [Node Version Manager]
    - **PROTIP**: Be sure to follow the instructions that appear in your console after installation!

### Tips & Tricks

*Check out the [OpenSea FAQs] if you get stuck!*

1. Begin by cloning the [opensea-creatures] repo locally.
2. Run `cp .env.sample .env` to copy the sample `.env` file.
3. In `.env`, fill in your key for Infura in `INFURA_KEY`, your MetaMask mnemonic in `MNEMONIC`, etc. Use the instructions in the [opensea-creatures] repo to learn more!
4. Use the exported constants when executing commands by running `source .env` in your active terminal window.
5. In Step 2, you won't need to deploy a Metadata API; one has already been provided for you in the sample [opensea-creatures] project.

### Stretch Challenge

If you finish early, examine the [opensea-creatures] codebase. Dig in to the Smart Contract implementation and the custom `truffle.js` settings.

  **How could you use this project to assist you in deploying your own assets to a test network? To a ÐApps marketplace? To the Ethereum mainnet?**

## 🌴 [10m] BREAK

## 📖 [20m] Code Walkthrough

At the end of class, walk through the tutorial code with students step by step.

Ask for questions and highlight difficult areas in the tutorial experience.

## 📚 Resources & Credits

- **[OpenSea Docs]**: Let your users freely trade your `ERC721` items by opening your own marketplace on OpenSea
- **[OpenSea FAQs]**: .
- **[OpenSea Developer Tutorial]**: Simple tutorial for a customizable marketplace for buying and selling on OpenSea.
- **[opensea-creatures]**: This is a very simple sample `ERC721` for the purposes of demonstrating integration with the OpenSea marketplace. We include a script for minting the items.
- **[Sample Node.js Metadata API]**: Use this repo to make an API for serving metadata about your tokens (`ERC721` or `ERC1155`) to marketplaces like OpenSea and other third parties. Metadata for each token can include an image, animation, attributes, scalar properties, boost properties, and more!
- **[Sample Python Metadata API]**: This is a very simple sample Python Flask app for serving the `ERC721` metadata for the OpenSea creatures `ERC721` contracts, as specified in the OpenSea developer docs.

[OpenSea FAQs]: https://docs.opensea.io/docs/frequently-asked-questions
[OpenSea Docs]: https://docs.opensea.io/
[OpenSea Developer Tutorial]: https://docs.opensea.io/docs/getting-started
[opensea-creatures]: https://github.com/ProjectOpenSea/opensea-creatures
[Node Version Manager]: https://github.com/nvm-sh/nvm#installation-and-update
[OpenSea]: https://opensea.io
[Sample Node.js Metadata API]: https://github.com/ProjectOpenSea/metadata-api-nodejs
[Sample Python Metadata API]: https://github.com/ProjectOpenSea/metadata-api-python
[Dottabot Software License]: https://opensea.io/category/dottabotlicense
[Digital Art Chain]: https://opensea.io/category/digitalartchain
