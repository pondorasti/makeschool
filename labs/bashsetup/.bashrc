# ------------------ !! MAKE SCHOOL CONFIG: DO NOT REMOVE !! ----------------- #
# Set dir colors to bold cyan. Standard files shown in white. Executable files are red:
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorize `ls` and `grep` output:
alias ls='ls -Ga'
alias grep='grep --color=always'

# Add Git information to prompt:
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share

    # Students: You can choose any theme in this list:
    # https://github.com/magicmonty/bash-git-prompt/tree/master/themes
    GIT_PROMPT_THEME="Single_line_Solarized"

    GIT_PROMPT_IGNORE_SUBMODULES=1
    GIT_PROMPT_WITH_VIRTUAL_ENV=1
    GIT_PROMPT_SHOW_UPSTREAM=1
    GIT_PROMPT_SHOW_UNTRACKED_FILES=no
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
# -------------------------- END MAKE SCHOOL CONFIG -------------------------- #
