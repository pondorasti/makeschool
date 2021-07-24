# Configuring VSCode for Solidity 0.7.0

1. Install `solhint`:

    ```bash
    npm install -g solhint
    ```

1. Install the [Solidity](https://marketplace.visualstudio.com/items?itemName=juanblanco.solidity) extension in VSCode.
1. Press `Command` + `Shift` + `P` to open the Command Palette.
1. Type in `Preferences: Open Settings (JSON)` and press `Enter`.
<!--
1. Add the following JSON to the bottom of `settings.json`:

    ```json
    "solidity.compileUsingRemoteVersion": "0.7.0",
    "solidity.linter": "solhint",
    "solidity.solhintRules": {
      "avoid-sha3": "warn"
    }
    ```
    -->
