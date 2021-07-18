#!/usr/bin/env bash
# ------------------------------- DO NOT REMOVE ------------------------------ #
# `make_assignment` will overwrite these values.
REPLACE_GITHUB_REPO
REPLACE_REPO_NAME
# ------------------------------- DO NOT REMOVE ------------------------------ #


# Set working directory so we can set up the autograder.
cd /autograder/source

# Install Python:
DEBIAN_FRONTEND=noninteractive apt-get update -qq -y \
    && apt-get install -qq -y python3 python3-pip python3-dev

# Copy .ssh directory:
mkdir -p /root/.ssh
cp ssh_config /root/.ssh/config
cp deploy_key /root/.ssh/deploy_key
chmod 400 /root/.ssh/deploy_key

# Prevent host key verification errors at runtime:
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clone autograder files:
git clone $GITHUB_REPO /autograder/$REPO_NAME

# Install Python dependencies:
pip3 install -r /autograder/$REPO_NAME/requirements.txt
