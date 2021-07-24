# ---------------------------------------------------------------------------- #
#                             makecoin setup script                            #
# ---------------------------------------------------------------------------- #
#!/bin/bash

# --------------------------- Variables & Functions -------------------------- #
PROJECT_DIR=$(pwd)
BROWNIE_DIR=$PROJECT_DIR/brownie-setup
function add_dotenv() {
    if [ ! grep --quiet "$1=" ".env" ]; then
        echo -e "$1=$2\n" >>.env
    fi
}

# --------------------------- Install Prerequisites -------------------------- #

if [ -d ".git" ]; then
    echo -e "[ERROR] Git repository detected! Please run this command in a directory that isn't a Git repository."
fi

if [ ! -f "/usr/local/bin/ganache-cli" ]; then
    npm install -g ganache-cli
fi

# ------------------------------ Install Brownie ----------------------------- #
if [ ! -f "/usr/local/bin/brownie" ]; then
    cd $PROJECT_DIR
    git clone --quiet https://github.com/eth-brownie/brownie.git $BROWNIE_DIR && cd $BROWNIE_DIR
    python3 setup.py install
    cd $PROJECT_DIR
    rm -rf brownie-setup
fi

# -------------------------- Configure Starter Pack -------------------------- #
echo -n "Type the name of your new coin, then press [ENTER]: "
read PROJECT_NAME

# --------------------------- Install Starter Pack --------------------------- #
if [ -d "$PROJECT_NAME" ]; then
    echo -e "[ERROR] A directory with the name "$PROJECT_NAME" already exists." && exit 1
else
    // Clone repo, create venv, install requirements, and initialize pre-commit hooks.
    git clone --quiet git@github.com:Make-School-Labs/makecoin $PROJECT_NAME && cd $PROJECT_NAME
    python3 -m venv venv && source venv/bin/activate
    pip install -r requirements.txt
    pre-commit install

    // Create .env file with important keys:
    touch .env
    add_dotenv "GITHUB_TOKEN" ""
    add_dotenv "ETHERSCAN_TOKEN" ""
    add_dotenv "WEB3_INFURA_PROJECT_ID" ""

    brownie pm install OpenZeppelin/openzeppelin-contracts@3.1.0
fi

# ----------------------------------- Exit ----------------------------------- #
echo -e "[DONE] $PROJECT_NAME created! Open $PROJECT_DIR/$PROJECT_NAME in VSCode to start coding."
exit 0
