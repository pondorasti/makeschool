# 📜 Day 8: Tying it All Together

## ⏱ Agenda {docsify-ignore}

1. [📖 [30m] Overview](#%F0%9F%93%96-30m-Overview)
2. [💻 [20m] In Class Activity I](#%F0%9F%92%BB-20m-In-Class-Activity-I)
3. [🌴 [10m] BREAK](#%F0%9F%8C%B4-10m-BREAK)
4. [💻 [35m] In Class Activity II](#%F0%9F%92%BB-35m-In-Class-Activity-II)
5. [📖 [15m] Smart Contract Tips & Tricks](#%F0%9F%93%96-15m-Smart-Contract-Tips--Tricks)
6. [📚 Resources & Credits](#%F0%9F%93%9A-Resources--Credits)

<!-- ## 🏆 Learning Objectives -->

## 📖 [30m] Overview

### Demo

Go over the main points of the [droxey/rainbowcoin] project, including:

- Truffle boxes, project structure, architectural decisions, technologies used, bugs, truffle commands
- Writing and compiling contracts (`RainbowCoin.sol`, `Migrations.sol`, `Metadata.sol`)
- Creating and running migrations
- Writing and running tests

## 💻 [20m] In Class Activity I

### Thinking it Through

1. Create a file named `SmartContractNameTest.js` inside of the `test` folder in your project's root directory.
2. In a comment block at the top of the file, write down what capabilities your project's smart contract should have. What does the contract do? **See the below example for [OwnedToken]**:
   ```js
   // OwnedTokenTests.js
   //
   // 1. Should allow only the owner to change the Token name.
   // 2. Should transfer tokens to anyone except Token's current owner
   ```
3. If you finish early, begin working on the second in class activity, where you'll work on implementing these using the Truffle testing framework.

## 🌴 [10m] BREAK

## 💻 [35m] In Class Activity II

### Coding it Up

**Challenge**: Implement each sentence as tests inside `test\SmartContractNameTest.js`.

Use the example file below to help you get started.

**Be sure to replace `YourContractName` with your project's contract name**!

```js
const YourContractName = artifacts.require('./YourContractName.sol');
const _ = '        ';


contract('YourContractName', async function (accounts) {
  let token;

  before(done => {
    (async () => {
      try {
        // TODO: All setup steps belong here, including contract deployment.
        token = await YourContractName.new();
        var tx = await web3.eth.getTransactionReceipt(token.transactionHash);
        totalGas = totalGas.plus(tx.gasUsed);
        console.log(_ + tx.gasUsed + ' - Deploy YourContractName');
        token = await YourContractName.deployed();

        // Output how much gas was spent
        console.log(_ + '-----------------------');
        console.log(_ + totalGas.toFormat(0) + ' - Total Gas');
        done();
      }
      catch (error) {
        console.error(error);
        done(false);
      }
    })();
  });

  describe('YourContractName.sol', function () {
    it('Should always pass this canary test', async () => {
      assert(true === true, 'this is true');
    });

    it("Should call another function on your deployed contract", async () => {
      let instance = await YourContractName.deployed();
      // TODO: Write the code here to call a contract function
    });
 });
});
```

## 📖 [15m] Smart Contract Tips & Tricks

- **Go through the list of [Smart Contract Best Practices] with students**:
  - Start with [Using `assert()`, `require()`, `revert()` properly](https://consensys.github.io/smart-contract-best-practices/recommendations/#use-assert-require-revert-properly)
  - Scroll through the rest of the list and compare and contrast practices.
  - Finally, wrap up with the short list of [Token Specific Recommendations](https://consensys.github.io/smart-contract-best-practices/tokens/).
  - Want more? Check out this article: [9 Tips on Getting Your Ethereum Smart Contract Right](https://medium.com/coinmonks/9-tips-on-getting-your-ethereum-smart-contract-right-4981a7d9883c)

## 📚 Resources & Credits

- **[droxey/rainbowcoin]**: The ERC-721 base token as reviewed in class today.
- **[OwnedToken]**: ETHFiddle from example contract used in Activity I.

[droxey/rainbowcoin]: https://github.com/droxey/rainbowcoin
[OwnedToken]: https://ethfiddle.com/Cgoy9PMgWS
[Smart Contract Best Practices]: https://consensys.github.io/smart-contract-best-practices/recommendations/
