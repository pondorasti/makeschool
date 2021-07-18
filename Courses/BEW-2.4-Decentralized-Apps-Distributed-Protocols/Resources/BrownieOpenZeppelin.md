# Brownie + OpenZeppelin

> [!NOTE]
> **Source**: [_Using OpenZeppelin Contracts with Python and Brownie_](https://medium.com/@iamdefinitelyahuman/using-openzeppelin-contracts-with-python-and-brownie-ff7053d63bbe).

When building smart contracts, the importance of security cannot be overstated. We are writing code that cannot be altered once deployed, and that often handles significant sums of real-world value. There is no margin for error!

[OpenZeppelin](https://openzeppelin.com/) has long recognized the need for security in this immutable world. Since 2016 they’ve actively maintained a library of smart contracts that other developers can use, a secure foundation upon which to build. Over the years, [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) has become the most popular Solidity library in the industry and helped to define many standards and best practices. It has seen over a million downloads and is incorporated into countless projects that are deployed on the Ethereum main-net.

## Using OpenZeppelin with Python and Brownie

OpenZeppelin releases each version of their library on [NPM](https://www.npmjs.com/package/@openzeppelin/contracts) — useful if you’re a JavaScript aficionado, less so if you prefer Python. Until now, using OpenZeppelin as a Python developer required manually cloning the repo and copying the desired contracts into your project. Not an insurmountable challenge, but significantly more work than a one-liner installation.

With the newest release of [Brownie](https://github.com/iamdefinitelyahuman/brownie) comes the [Brownie Package Manager](https://eth-brownie.readthedocs.io/en/stable/package-manager.html). Now integration with existing libraries is quick and painless! For example, to install [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts):

```bash
brownie pm install OpenZeppelin/openzeppelin-contracts@3.0.0
```

That’s it! The installed package is now available for import within any of your projects:

```solidity
pragma solidity ^0.6.00;
import "OpenZeppelin/openzeppelin-contracts@3.0.0/contracts/math/SafeMath.sol";


contract Foo {
}
```

No copying files, no remapping import paths, no thought about namespace collisions… it *just works*.

Packages can be retrieved from Github as well as [ethPM](https://www.ethpm.com/). Any Github repository with tagged releases is a potential package. Along with OpenZeppelin you can install and build on other popular frameworks. For example, to add [AragonOS](https://github.com/aragon/aragonOS) as a package:

```bash
brownie pm install aragon/aragonOS@4.4.0
```

Of course not every repository will work — particularly those that depend on other NPM packages. This is a new feature and we’re still refining the process of interpreting repos as installable packages. If you run into issues installing a particular repository that you think should work, please join us on [Gitter](https://gitter.im/eth-brownie/community) and we’ll see if we can find a solution.

## Creating Your Own Package

Any Brownie project stored on Github can work as a package. Simply make a [tagged release](https://help.github.com/en/github/administering-a-repository/managing-releases-in-a-repository) and it will be available for others to install. The package name is defined as:

```txt
\[ORGANIZATION\]/\[REPOSITORY\]@\[VERSION\]
```

If your project relies on other packages, you must also declare those dependencies within your [configuration file](https://eth-brownie.readthedocs.io/en/stable/package-manager.html#declaring-project-dependencies):

```yaml
dependencies:
 - OpenZeppelin/openzeppelin-contracts@3.0.0
```
