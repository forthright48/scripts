# I generally keep all my scripts in ~/me/bin. So I need to add the path to PATH.

# Add path
MY_BIN="$HOME/me/bin"
MY_OFFICE=${HOME}/me/bin/office
NPM_GLOBAL="/home/forthright48/.npm-global/bin"
export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"

PATH="$PATH:$MY_BIN:$NPM_GLOBAL:$GOBIN:$MY_OFFICE"

# Alias
alias chrome="google-chrome-stable </dev/null >/dev/null 2>&1"
alias system-update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias mysource="source ~/.bashrc"

alias mongostart="mongod --dbpath \"/home/forthright48/.mongod/data/db\""
alias myg++="g++ -std=c++11 -D forthright48"

# git
alias gitclean="git rm -r --cached ."
alias gitlog="git log --graph --oneline --all --decorate"
alias gitlog="git log --graph --oneline --all --decorate"
alias gitdiff="git difftool --dir-diff -t kompare"
alias gitshow="git difftool --dir-diff -t kompare HEAD^ HEAD"

# docker
alias docker_dangling="docker images -f \"dangling=true\" -q"

# function to set terminal title
function set-title(){
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# zsh options
# unsetopt share_history
# stty start undef
# stty stop undef
# setopt noflowcontrol

# Virtual Env
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/me/projects/python
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source $HOME/.local/bin/virtualenvwrapper.sh

# Source my custom functions
source ${MY_BIN}/library.sh

# Finally, source office
if [[ -a ${MY_BIN}/office/mybash.sh ]]; then
    source ${MY_BIN}/office/mybash.sh
fi