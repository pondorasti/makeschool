#!/bin/bash
# ------------------------------------------------------------------------------------------ #
#                                          bashsetup                                         #
#              Configures a default bash environment for Make School students.               #
#     Repo: https://github.com/Make-School-Labs/bashsetup     ---    Updated: 08/17/2020     #
# ------------------------------------------------------------------------------------------ #
echo "----------------------------------------------------------------------------------------"
echo -e "⚙️  Installing bash settings for Make School students..."
echo "----------------------------------------------------------------------------------------"

CONFIG_PATH="${HOME}/.bashrc"
PROFILE_PATH="${HOME}/.bash_profile"

# Show users the result of each test using this function.
function log() {
    printf "%-3s %-100s\n" "   $1" "$2"
}

# Bash on macOS is very outdated. Install latest bash via brew:
if brew info bash | grep --quiet 'Not installed'; then
    log "⚠️" "Latest bash missing; installing now..."
    brew install --quiet bash >>/dev/null
fi
log "✅" "Latest bash installed in $(brew --prefix)/bin."

# Write Make School settings to the end of .bashrc, if missing:
touch $CONFIG_PATH
if ! grep --quiet "!! MAKE SCHOOL CONFIG: DO NOT REMOVE !!" $CONFIG_PATH; then
    curl -sSL https://raw.githubusercontent.com/Make-School-Labs/bashsetup/master/.bashrc >>$CONFIG_PATH
    log "✅" "Configuration added for bash-git-prompt."
fi
log "✅" "Initialization script found in $CONFIG_PATH."

# Load config when any login shell is invoked:
touch $PROFILE_PATH
if ! grep --quiet "source ~/.bashrc" $PROFILE_PATH; then
    echo -e "\nif [ -r ~/.bashrc ]; then\n    source ~/.bashrc\nfi" >>$PROFILE_PATH
fi

# Install bash-git-prompt via brew, if missing:
if brew info bash-git-prompt | grep --quiet 'Not installed'; then
    log "⚠️" "bash-git-prompt missing; installing now..."
    brew install --quiet bash-git-prompt >>/dev/null
fi
log "✅" "Prompt installed and ready to use."

# Copy Terminal settings file to ~/Downloads in case students want to use it.
curl -sSL https://raw.githubusercontent.com/Make-School-Labs/bashsetup/master/MakeSchool.terminal >>$HOME/Downloads/MakeSchool.terminal
log "✅" "Terminal settings saved. Double-click ~/Downloads/MakeSchool.terminal to use."

# Render info messages to user:
echo "----------------------------------------------------------------------------------------"
echo -e "🚀 DONE: Installation and configuration complete!"
echo "----------------------------------------------------------------------------------------"
echo -e "🔑 IMPORTANT: Enter your password below to change your shell and complete setup:"
echo "----------------------------------------------------------------------------------------"

# Set shell to latest bash:
echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
echo "----------------------------------------------------------------------------------------"
echo -e "ℹ️  NOTE: Terminal will automatically close after entering your password."
echo "----------------------------------------------------------------------------------------"
chsh -s "$(brew --prefix)/bin/bash"

# If successful, kill all instances of Terminal.app:
status=$?
[ $status -eq 0 ] && killall Terminal
