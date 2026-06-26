# shellcheck shell=zsh

# Environment Configuration
# This file contains environment variables, PATH modifications, and shell
# configuration for zsh. It's sourced by ~/.zshrc during shell initialization.

# Locale Configuration
# Set a consistent UTF-8 locale for CLI tools and terminal rendering
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ATUIN_NOBIND="true"

# zoxide doctor: silence the false-positive "possible configuration issue"
# warning emitted under Claude Code. Claude Code runs commands via a one-time
# shell snapshot that captures zoxide's functions but not the loose
# `chpwd_functions+=(__zoxide_hook)` assignment, so the hook looks unregistered
# and the doctor complains on every `cd`. Exported here so the `claude` process
# and its snapshot subshells inherit it. Interactive shells register the hook
# correctly, so the doctor never fires there anyway.
export _ZO_DOCTOR=0

# PATH Management
# Prepend a directory only once, and only when it exists.
path_prepend() {
  local dir="$1"
  [[ -d "$dir" ]] || return
  [[ ":$PATH:" == *":$dir:"* ]] || PATH="$dir${PATH:+:$PATH}"
}

# Package Manager: Homebrew
# Homebrew provides additional packages not available in system repositories.
# Use static prefixes to avoid running `brew shellenv` on every shell startup.
if [[ -z "${HOMEBREW_PREFIX:-}" ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -d "/opt/homebrew" ]]; then
      HOMEBREW_PREFIX="/opt/homebrew"
    elif [[ -d "/usr/local/Homebrew" || -x "/usr/local/bin/brew" ]]; then
      HOMEBREW_PREFIX="/usr/local"
    fi
  elif [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
    HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  elif (( $+commands[brew] )); then
    HOMEBREW_PREFIX="${commands[brew]:h:h}"
  fi
fi

if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
  export HOMEBREW_PREFIX
  path_prepend "$HOMEBREW_PREFIX/sbin"
  path_prepend "$HOMEBREW_PREFIX/bin"

  if [[ -d "$HOMEBREW_PREFIX/share/man" && ":${MANPATH:-}:" != *":$HOMEBREW_PREFIX/share/man:"* ]]; then
    export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH:+:$MANPATH}:"
  fi

  if [[ -d "$HOMEBREW_PREFIX/share/info" && ":${INFOPATH:-}:" != *":$HOMEBREW_PREFIX/share/info:"* ]]; then
    export INFOPATH="$HOMEBREW_PREFIX/share/info${INFOPATH:+:$INFOPATH}"
  fi
fi

# Node Version Manager (NVM)
# NVM manages multiple Node.js versions. It is lazy-loaded because nvm.sh is
# one of the slowest parts of interactive shell startup.
export NVM_DIR="$HOME/.nvm"
export NVM_HOMEBREW_PREFIX="${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/opt/nvm}"

_load_nvm() {
  local nvm_script=""
  local nvm_completion=""

  unset -f nvm node npm npx

  if [[ -n "${NVM_HOMEBREW_PREFIX:-}" && -s "$NVM_HOMEBREW_PREFIX/nvm.sh" ]]; then
    nvm_script="$NVM_HOMEBREW_PREFIX/nvm.sh"
    nvm_completion="$NVM_HOMEBREW_PREFIX/etc/bash_completion.d/nvm"
  elif [[ -s "$NVM_DIR/nvm.sh" ]]; then
    nvm_script="$NVM_DIR/nvm.sh"
    nvm_completion="$NVM_DIR/bash_completion"
  fi

  if [[ -z "$nvm_script" ]]; then
    print -u2 "nvm is not installed or could not be found"
    return 127
  fi

  source "$nvm_script"
  [[ -o interactive && -s "$nvm_completion" ]] && source "$nvm_completion"
}

nvm() { _load_nvm && nvm "$@"; }
node() { _load_nvm && command node "$@"; }
npm() { _load_nvm && command npm "$@"; }
npx() { _load_nvm && command npx "$@"; }

# Default Editors
# Set preferred editors for different contexts
export EDITOR='nvim'    # Primary editor (Neovim)
export VISUAL='nvim'    # Visual editor
export PAGER='less'     # Pager for viewing files

# Rust Programming Language
# Rust toolchain and package manager (Cargo) configuration
export RUSTUP_HOME="$HOME/.rustup"
export CARGO_HOME="$HOME/.cargo"
path_prepend "$HOME/.cargo/bin"

# Claude Code
path_prepend "$HOME/.local/bin"
export PATH

#fzf Configuration
# Guard with interactive check: `fzf --zsh` emits ZLE/bindkey setup that only
# works in interactive shells; sourcing it in non-interactive shells (scripts,
# Claude Code snapshots) just produces "can't change option: zle" noise.
[[ -o interactive ]] && source <(fzf --zsh)


# AWS Configuration
# Default AWS region for CLI operations
export AWS_DEFAULT_REGION='us-east-1'
# AWS profile setting (currently disabled)
# export AWS_DEFAULT_PROFILE='ss-np'
