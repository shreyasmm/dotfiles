#!/bin/sh

# =============================================================================
# Environment Configuration
# =============================================================================
# This file contains environment variables, PATH modifications, and shell
# configuration for zsh. It's sourced by ~/.zshrc during shell initialization.

# -----------------------------------------------------------------------------
# Locale Configuration
# -----------------------------------------------------------------------------
# Set locale to Indian English with UTF-8 encoding for proper character support
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# -----------------------------------------------------------------------------
# Plugin Manager: Zinit
# -----------------------------------------------------------------------------
# Zinit is a flexible and fast Zsh plugin manager
# Using submodule version for better version control
ZINIT_HOME="$HOME/.dotfiles/submodules/zinit"
source "${ZINIT_HOME}/zinit.zsh"

# -----------------------------------------------------------------------------
# Package Manager: Homebrew
# -----------------------------------------------------------------------------
# Initialize Homebrew environment (Linux version)
# Homebrew provides additional packages not available in system repositories
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Enable fzf integration if available (currently disabled)
# eval "$(fzf --zsh)"

# -----------------------------------------------------------------------------
# Node Version Manager (NVM) - Lazy Loading
# -----------------------------------------------------------------------------
# NVM manages multiple Node.js versions
# Lazy loading prevents slow shell startup by only loading when nvm is called
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

# -----------------------------------------------------------------------------
# Zsh Completions
# -----------------------------------------------------------------------------
# Enhanced tab completion using Homebrew's completion system
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# -----------------------------------------------------------------------------
# Default Editors
# -----------------------------------------------------------------------------
# Set preferred editors for different contexts
export EDITOR='nvim'    # Primary editor (Neovim)
export VISUAL='nano'    # Visual editor (fallback to nano)
export PAGER='less'     # Pager for viewing files

# -----------------------------------------------------------------------------
# Key Bindings
# -----------------------------------------------------------------------------
# Ctrl+P: Search backward in command history
bindkey '^p' history-search-backward
# Ctrl+N: Search forward in command history
bindkey '^n' history-search-forward

# -----------------------------------------------------------------------------
# Rust Programming Language
# -----------------------------------------------------------------------------
# Rust toolchain and package manager (Cargo) configuration
export RUSTUP_HOME="$HOME/.rustup"
export CARGO_HOME="$HOME/.cargo"
export PATH="$HOME/.cargo/bin:$PATH"

# -----------------------------------------------------------------------------
# AWS Configuration
# -----------------------------------------------------------------------------
# Default AWS region for CLI operations
export AWS_DEFAULT_REGION='us-east-1'
# AWS profile setting (currently disabled)
# export AWS_DEFAULT_PROFILE='ss-np'

# -----------------------------------------------------------------------------
# Zsh History Configuration
# -----------------------------------------------------------------------------
# Comprehensive history management for better command recall
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000           # Number of commands to keep in memory
SAVEHIST=10000000           # Number of commands to save to history file
HISTDUP=erase               # Remove duplicate entries

# History behavior options
setopt BANG_HIST                 # Treat the '!' character specially during expansion
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry
setopt HIST_VERIFY               # Don't execute immediately upon history expansion
setopt HIST_BEEP                 # Beep when accessing nonexistent history