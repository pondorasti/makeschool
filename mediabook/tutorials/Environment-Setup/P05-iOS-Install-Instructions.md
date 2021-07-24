---
title: "iOS Install Instructions"
slug: ios-install-instructions
---

You should follow this guide to update and install your iOS development environment before Python, as the Python installers actually have some dependencies on the iOS tools.

# Command Line Tools

Install the Xcode Command Line Tools, which is a bundle of command-line based software for developers. It includes things like `git`, `gcc` and `clang`. For a complete list, see [this article](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).

> [action]
>
> Install Command Line Tools by running this command in terminal:
>
```bash
$ xcode-select --install
```

# Download Xcode

To install the latest version of Xcode, you need the latest version of Mac OS before you install Xcode.

> [action]
>
> 1. On the upper left corner, click the apple icon, and click `About This Mac`
> 1. From the `Overview` tab, click on `Software Update`, and if there are any updates available, install them.

From here, Xcode is an easy download in the Mac App Store:

> [action]
>
> 1. Use the keyboard shortcut `command` + `spacebar` and type "app store" to open the App Store.
> 1. Once there, search for the program `Xcode` and click `Install`.

After it's installed (this will take some time, it's not a quick download), you should open Xcode to allow it to do some additional installation and configuration. Note that you should **not install a beta version of Xcode!** Only install a production version through the app store.
