#!/bin/sh

# Prefer Indian English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# zplug
export ZPLUG_HOME="$HOME/.dotfiles/submodules/zplug"

# zplug init
source $HOME/.dotfiles/submodules/zplug/init.zsh

# brew
eval $(~/.dotfiles/submodules/linuxbrew/brew/bin/brew shellenv)

# zsh completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# editor
export EDITOR='vim'
export VISUAL='nano'
export PAGER='less'

# path
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH=$PATH:/snap/bin
# eval "$(rbenv init -)"


# nvm
export NVM_DIR="$HOME/.dotfiles/submodules/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# work
export AWS_DEFAULT_PROFILE="ss-np"

# history management
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Powerlevel9k Config
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv virtualenv nvm )
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print $'\ue0bd') "
#POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_folder_marker"

DEFAULT_USER=$USER
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_HOME_ICON="\uf015"
POWERLEVEL9K_HOME_SUB_ICON="\uf015"
POWERLEVEL9K_FOLDER_ICON="\uf74a"
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_BATTERY_ICON="\uf201"

POWERLEVEL9K_STATUS_VERBOSE=true
