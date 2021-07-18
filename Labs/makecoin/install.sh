#!/bin/bash
# ---------------------------------------------------------------------------- #
#                             makecoin setup script                            #
# ---------------------------------------------------------------------------- #
PROJECT_DIR=$(pwd)
BROWNIE_DIR=$PROJECT_DIR/brownie-setup

# [Step 0] Install prerequisites:
if [ ! -f "/usr/local/bin/ganache-cli" ]; then
    npm install -g ganache-cli
fi

# [Step 1] Clone Brownie and install using setuptools:
if [ ! -f "/usr/local/bin/brownie" ]; then
    cd $PROJECT_DIR
    git clone https://github.com/eth-brownie/brownie.git $BROWNIE_DIR && cd $BROWNIE_DIR
    python3 setup.py install
    cd $PROJECT_DIR
    rm -rf brownie-setup
fi

# [Step 2] Clone project, create virtualenv, install requirements:
echo -n "Type the name of your new coin, then press [ENTER]: "
read PROJECT_NAME

if [ -d "$PROJECT_NAME" ]; then
    echo "[ERROR] A directory with the name "$PROJECT_NAME" already exists."
    exit 1
else
    git clone git@github.com:Make-School-Labs/makecoin $PROJECT_NAME
    cd $PROJECT_NAME
    python3 -m venv venv
    source venv/bin/activate
    pip install requirements.txt
fi

# [Step 3]: Present success message and exit.
echo -e "[DONE] $PROJECT_NAME created in $PROJECT_DIR!"
exit 0
