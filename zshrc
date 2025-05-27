# =============================================================================
# Zsh Configuration
# =============================================================================
# Main zsh configuration file that initializes the shell environment,
# loads plugins, and configures the prompt theme.

# -----------------------------------------------------------------------------
# Powerlevel10k Instant Prompt
# -----------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt for faster shell startup
# This must stay close to the top of ~/.zshrc for optimal performance
# Any initialization code that may require console input (password prompts,
# [y/n] confirmations, etc.) must go above this block
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# Load Configuration Files
# -----------------------------------------------------------------------------
# Source environment variables and shell configuration
source $HOME/.dotfiles/shell/env.sh

# Source command aliases and shortcuts
source $HOME/.dotfiles/shell/alias.sh

# -----------------------------------------------------------------------------
# Zinit Plugin Configuration
# -----------------------------------------------------------------------------
# Background notifications for long-running commands
# Shows desktop notification when command completes
zinit ice wait lucid
zinit snippet OMZP::bgnotify

# Command not found suggestions (currently disabled)
# Suggests package installation for missing commands
# zinit ice wait lucid
# zinit snippet OMZP::command-not-found

# Syntax highlighting for command line
# Provides real-time syntax highlighting as you type
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# Additional useful plugins (currently disabled)
# Uncomment any of these to enable:

# Auto-suggestions based on command history
# zinit ice wait lucid
# zinit light zsh-users/zsh-autosuggestions

# Shows aliases when you use the full command
# zinit ice wait lucid
# zinit light djui/alias-tips

# Fuzzy tab completion with fzf integration
# zinit ice wait lucid
# zinit light Aloxaf/fzf-tab

# Advanced autocompletion system
# zinit ice wait lucid
# zinit light marlonrichert/zsh-autocomplete

# -----------------------------------------------------------------------------
# Theme Configuration
# -----------------------------------------------------------------------------
# Load Powerlevel10k theme with shallow git clone for faster loading
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# Load Oh My Zsh completion library for enhanced tab completion
zinit snippet OMZL::completion.zsh

# -----------------------------------------------------------------------------
# Additional Oh My Zsh Components
# -----------------------------------------------------------------------------
# Additional completion libraries (currently disabled)
# zinit load "lib/completion", from:oh-my-zsh

# -----------------------------------------------------------------------------
# Powerlevel10k Theme Customization
# -----------------------------------------------------------------------------
# Load personal Powerlevel10k configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

colorscript
