#!/bin/sh

# =============================================================================
# Shell Aliases Configuration
# =============================================================================
# This file contains command aliases and shortcuts to improve productivity
# and provide consistent command behavior across different systems.

# -----------------------------------------------------------------------------
# System Information & Utilities
# -----------------------------------------------------------------------------
# Get current week number
alias week='date +%V'

# Get external IP address using OpenDNS resolver
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Start a simple HTTP server in current directory (Python 3)
alias webserver="python -m http.server"

# -----------------------------------------------------------------------------
# Clipboard Operations (Linux)
# -----------------------------------------------------------------------------
# Copy to clipboard (mimics macOS pbcopy)
alias pbcopy='xclip -selection clipboard'

# Paste from clipboard (mimics macOS pbpaste)
alias pbpaste='xclip -selection clipboard -o'

# -----------------------------------------------------------------------------
# Shell & Configuration Management
# -----------------------------------------------------------------------------
# Reload zsh configuration
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# Clear terminal screen
alias c='clear'

# Mount RAM disk for temporary high-speed storage (2GB)
alias ramdisk="sudo mount -t tmpfs tmpfs /home/shrey/Others/ramdisk -o size=2048m"

# -----------------------------------------------------------------------------
# Safe File Operations
# -----------------------------------------------------------------------------
# Interactive prompts for potentially destructive operations
alias rm='rm -i'        # Prompt before removing files
alias cp='cp -i'        # Prompt before overwriting files
alias mv='mv -i'        # Prompt before overwriting files

# -----------------------------------------------------------------------------
# System Monitoring
# -----------------------------------------------------------------------------
# Display free memory in human-readable format (MB)
alias free='free -m'

# Display disk usage in human-readable format
alias df='df -h'

# -----------------------------------------------------------------------------
# File Search Shortcuts
# -----------------------------------------------------------------------------
# Find directories by name
alias fd='find . -type d -name'

# Find files by name
alias ff='find . -type f -name'

# -----------------------------------------------------------------------------
# Command Pipeline Shortcuts
# -----------------------------------------------------------------------------
# These aliases make command chaining more convenient
alias H='| head'        # Show first lines of output
alias T='| tail'        # Show last lines of output
alias G='| grep'        # Filter output with grep
alias L="| less"        # Page through output

# -----------------------------------------------------------------------------
# Kubernetes Management
# -----------------------------------------------------------------------------
# Kubernetes command shortcuts for faster cluster management
alias k='kubectl'                                    # Main kubectl command
alias kg='kubectl get'                              # Get resources
alias awsssh="aws ssm start-session --target"       # AWS Systems Manager SSH

# -----------------------------------------------------------------------------
# Enhanced Command Replacements
# -----------------------------------------------------------------------------
# Modern alternatives to traditional commands with better features
alias vim='nvim'        # Use Neovim instead of vim
alias ls='lsd'          # Use lsd (LSDeluxe) for better file listing
alias cat='bat'         # Use bat for syntax highlighting and line numbers

# -----------------------------------------------------------------------------
# System Updates
# -----------------------------------------------------------------------------
# Comprehensive system update command for multiple package managers
alias update='npm -g update && brew upgrade && sudo dnf update && flatpak update'

# -----------------------------------------------------------------------------
# Visual Enhancements
# -----------------------------------------------------------------------------
# Display random colorful terminal art (using submodule)
alias colorscript='$HOME/.dotfiles/submodules/shell-color-scripts/colorscript.sh random'