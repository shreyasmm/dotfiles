# shellcheck shell=zsh

# Shell Aliases Configuration
# This file contains command aliases and shortcuts to improve productivity
# and provide consistent command behavior across different systems.

# System Information & Utilities
# Get current week number
alias week='date +%V'

# Get external IP address using OpenDNS resolver
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Start a simple HTTP server in current directory (Python 3)
alias webserver="python -m http.server"

# Clipboard Operations
# Keep native macOS commands; provide compatible Linux aliases when xclip exists.
if [[ "$OSTYPE" != "darwin"* ]] && command -v xclip >/dev/null 2>&1; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# Shell & Configuration Management
# Restart zsh so Powerlevel10k instant prompt initializes before the first prompt.
alias reload='exec zsh'

# Clear terminal screen
alias c='clear'

# ls
alias ll="ls -l --color=auto"

# Mount RAM disk for temporary high-speed storage (2GB)
alias ramdisk="sudo mount -t tmpfs tmpfs /home/shrey/Others/ramdisk -o size=2048m"

# Safe File Operations
# Interactive prompts for potentially destructive operations
alias rm='rm -i'        # Prompt before removing files
alias cp='cp -i'        # Prompt before overwriting files
alias mv='mv -i'        # Prompt before overwriting files

# System Monitoring
# Display free memory in human-readable format (MB)
alias free='free -m'

# Display disk usage in human-readable format
alias df='df -h'

# File Search Shortcuts
# Find directories by name
alias fd='find . -type d -name'

# Find files by name
alias ff='find . -type f -name'

# Command Pipeline Shortcuts
# These aliases make command chaining more convenient
alias -g H='| head'        # Show first lines of output
alias -g T='| tail'        # Show last lines of output
alias -g G='| grep'        # Filter output with grep
alias -g L='| less'        # Page through output

# Kubernetes Management
# Kubernetes command shortcuts for faster cluster management
alias k='kubectl'                                    # Main kubectl command
alias kg='kubectl get'                              # Get resources
alias awsssh="aws ssm start-session --target"       # AWS Systems Manager SSH

# Enhanced Command Replacements
# Modern alternatives to traditional commands with better features
alias vim='nvim'        # Use Neovim instead of vim
alias ls='lsd'          # Use lsd (LSDeluxe) for better file listing
alias cat='bat'         # Use bat for syntax highlighting and line numbers

# System Updates
# Comprehensive system update command for multiple package managers
alias update='npm -g update && brew upgrade && sudo dnf update && flatpak update'

# Visual Enhancements
# Display random colorful terminal art (using submodule)
alias colorscript='$HOME/.dotfiles/submodules/shell-color-scripts/colorscript.sh random'

alias activate='source .venv/bin/activate'

claude-verisk() {
  CLAUDE_CONFIG_DIR="$HOME/.claude-verisk" "$HOME/.local/bin/claude" "$@"
}

claude-dg() {
  CLAUDE_CONFIG_DIR="$HOME/.claude-dg" "$HOME/.local/bin/claude" "$@"
}

# Disable default claude command to prevent mistakes
claude() {
  print -u2 "Use claude-dg or claude-verisk"
  return 1
}
