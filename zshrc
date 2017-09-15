# Environment
export EDITOR="vim"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# Setup Theme:
ZSH_THEME="robbyrussell"
ZSH_THEME="dallas"
ZSH_THEME="dieter"
ZSH_THEME="gianu"
ZSH_THEME="nebirhos"
ZSH_THEME="pygmalion"
ZSH_THEME="jtriley"
ZSH_THEME="gentoo"
ZSH_THEME="flazz"

ZSH_THEME="dogenpunk"
ZSH_THEME="duellj"
ZSH_THEME="mrtazz"
ZSH_THEME="smt"
ZSH_THEME="trapd00r"
ZSH_THEME="trapd00r"
ZSH_THEME="avit"
ZSH_THEME="mrtazz"

DISABLE_AUTO_UPDATE="true"

# oh-my-zsh Plugins
plugins=(git history-substring-search)
plugins=(git)

# Init
source $ZSH/oh-my-zsh.sh

# tmux
alias tma="tmux attach -t"
alias tmk="tmux kill-session -t"
alias tml="tmux list-sessions"

tmn() {
  if [ ! -z $argv ]; then
    name=$argv
  else
    name="$(basename $(pwd) | sed "s/^\.//")"
  fi

  tmux new -s "$name"
}

# Get chmod value of file:
alias sf="stat -f "%N: %OLp""

# Lsof Bindings:
alias list="lsof -Pi | grep -i listen"
alias lst="lsof -Pi | grep -i listen"
alias lest="lsof -Pi | grep -i estab"

# Docker Bindings:
alias dbash="docker exec -it `docker ps -a | grep -i up | awk "{print $1}"` /bin/bash"
alias dkill="docker ps -qa | xargs docker kill"
alias drm="docker ps -qa | xargs docker rm"
alias dps="docker ps -a"

# Case insensitive ag (Search files in Directory)
alias agi="ag -i"

# Search recursively through directory for string (Similar to "agi"):
rnis() {
  grep -rnis $* ./*
}

alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias uuuu="cd ../../../../"

# Vagrant Commands:
alias vs="vagrant ssh"
alias vu="vagrant up"

# General Commands
alias t="tree"
alias postgress="postgres"
alias r="ranger"
alias f="find ."
alias p="python"
alias vi="vim"

# =============================================================================================
# Personal aliases and functions
# Source test environment commands alias
showMyScripts() {
  echo ""
  echo "     Commands"
  echo ""
  echo "     senv  <tool>   sources ~/Development/envs/<tool> file"
  echo "     doc   <tool>   opens ~/Development/docs/<tool>.md in macdown"
  echo ""
  echo "     Examples:"
  echo ""
  echo "     senv foo-tool - sources ~/Development/env/foo-tool file"
  echo "     doc bar - opens ~/Development/docs/bar.md file in macdown"
  echo ""
}

source_envs() {
  local app="$1"
  env_path="/Users/$USER/Development/envs"

  source "$env_path/$app"
}

alias myscripts=showMyScripts
alias senv=source_envs

# Documetation opener alias
open_doc() {
  local app_name="$1"
  docs_path="/Users/$USER/Development/docs"
  app_doc_file="$docs_path/$app_name.md"

  if ! [[ -f "$app_doc_file" ]]; then
    touch "$app_doc_file"
  fi
  macdown "$app_doc_file"
}
alias doc=open_doc
# =============================================================================================

[ -f "/Users/$USER/.ac/profile.bash" ] && source "/Users/$USER/.ac/profile.bash"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/Users/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/opt/libxml2/bin:$PATH"
