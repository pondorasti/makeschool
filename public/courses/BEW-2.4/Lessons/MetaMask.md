# MetaMask

> [!NOTE]
> This plan is a work in progress. Please check back at the start of class for updates.

## Sync Browser Extension and Mobile App

:link: **SOURCE**: [metamask.zendesk.com](https://metamask.zendesk.com/hc/en-us/articles/360032378452-How-to-Sync-with-MetaMask-Extension)

1. **Select `Sync or import your wallet` the first time MetaMask launches on your mobile device.**
1. On your computer, **open the extension** in your browser.
1. Go to `Settings` > `Advanced`
1. Click on `Sync with Mobile`
1. **Scan the QR Code to start syncing**

Alternatively, you can tap "Import using seed phrase" or go back and tap "Start exploring" to use a new wallet.

NOTE: Only accounts tied to the seed phrase, and loose accounts imported via private key or json will sync.  If you have a hardware wallet connected to MetaMask, that will not sync at this time.

## Basic Safety Tips

:link: **SOURCE**: [metamask.zendesk.com](https://metamask.zendesk.com/hc/en-us/articles/360015489591-Basic-Safety-Tips)

> [!DANGER]
> **MetaMask is not a cloud based solution.**
> <br><br>
> _**If your device breaks, is lost, stolen, or has data corruption, there is no way for the MetaMask Support team to recover this for you.**_
> <br><br>
> **This seed phrase is the only way to recover your MetaMask accounts.**

### Back Up Your Seed Phrase

The use of seed phrase is a standard most crypto wallets use. It's generated randomly when you create a MetaMask account, which is unique, and serves to generate addresses.

When you create a MetaMask wallet, you will be given your 12 word seed phrase. MetaMask does not control any of your personal/private data on our servers. Everything is encrypted on your browser and protected via your MetaMask password. So, when you lose your MetaMask accounts, and need to restore MetaMask, you could only do that with your seed phrase.

[How To Reveal (and save) Your Seed Phrase](/hc/en-us/articles/360015290032-How-to-Reveal-Your-Seed-Phrase)

When you restore MetaMask wallet, it restores MetaMask accounts too. If you have [imported accounts](/hc/en-us/articles/360015289932-What-are-imported-accounts-), you will have to [import them again](/hc/en-us/articles/360015489351-Importing-Accounts).

### Don't Share Private Keys or Seed Phrases

**Anyone who has your seed phrase, or private keys could send Ether or tokens from your accounts**.

**Never share them with anyone, including the MetaMask team.**

## When to Invest in a Hardware Wallet

Hardware wallets are commonly thought to be the safest, and most robust device to store your Ethers or tokens. It signs transactions through the private keys which are stored offline.

There is no such thing as too much safety. The basic guide her is by no means comprehensive. Always learn how to better protect your tokens, by learning from community, informative material or discussion channels[like this](https://www.reddit.com/r/ethereum/comments/6fr2lx/updated_its_time_to_get_real_stop_relying_on/?st=jes5xd8h&sh=61d2d61e).

## Add Token Suggestion

### Gather Token Details

| Token Attribute                           | Example |
| ----------------------------------------- | ------- |
| **Name**                                  |         |
| **Address**                               |         |
| **Symbol**                                |         |
| **Decimals**                              |         |
| **Network ID**                            |         |
| **Image URL** <small>_(optional)_</small> |         |

**After gathering all the information about your token, use this link to configure token suggestions for your final project: [Register Your Token on MetaMask](https://metamask.github.io/Add-Token/#edit).**

### Why Add Token Suggestions

When a user opens their MetaMask, they are shown a variety of assets, including tokens. By default, MetaMask auto-detects some major popular tokens and auto-displays them, but for most tokens, the user will need to add the token themselves.

While this is possible using our UI with the Add Token button, that process can be cumbersome, and involves the user interacting with contract addresses, and is very error prone.

**The link provided greatly enhances the security and experience of users adding your token to their MetaMask by taking advantage of the `wallet_watchAsset` API as defined in `EIP-747`  on the backend.**

## Register Your Contract's Method Names

:link: **SOURCE**: [docs.metamask.io](https://docs.metamask.io/guide/registering-function-names.html#registering-your-contract-s-method-names)

MetaMask uses the Parity on chain registry of function signatures to display method names on the confirm screen. For many common method names, like token methods, this allows MetaMask to successfully look up the method names by their [method signature](https://solidity.readthedocs.io/en/v0.4.21/abi-spec.html) . However, sometimes you're using a method that is not in that on chain registry, and MetaMask will simply display `Contract Interaction` to the user.

To add your contract's function names to this registry so it shows in the MetaMask interface, follow the below steps.

1. Go to the [Mainnet Parity signature registration contract on etherscan](https://etherscan.io/address/0x44691b39d1a75dc4e0a0346cbb15e310e6ed1e86#writeContract)

2. Connect MetaMask

3. Use etherscan's write contract feature to input the string value (without quotes or spaces) to the register function

    For example:

    `getOwners()`

    `execTransaction(address,uint256,bytes,uint8,uint256,uint256,uint256,address,address,bytes)`

4. Click "write"
5. Approve the transaction in MetaMask (you only pay gas)
