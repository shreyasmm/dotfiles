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
if [[ -o interactive && -t 1 && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# Load Configuration Files
# -----------------------------------------------------------------------------
# Source environment variables and PATH/runtime configuration
source "$HOME/.dotfiles/shell/env.sh"

# Source command aliases and shortcuts
source "$HOME/.dotfiles/shell/alias.sh"

# -----------------------------------------------------------------------------
# Zinit Bootstrap
# -----------------------------------------------------------------------------
# Zinit is a flexible and fast Zsh plugin manager.
ZINIT_HOME="$HOME/.dotfiles/submodules/zinit"
[[ -r "${ZINIT_HOME}/zinit.zsh" ]] && source "${ZINIT_HOME}/zinit.zsh"

# -----------------------------------------------------------------------------
# Theme Configuration
# -----------------------------------------------------------------------------
# Load Powerlevel10k early and without wait ice. Powerlevel10k officially
# supports depth=1 with zinit; other ice options can break instant prompt.
if [[ -o interactive && $+functions[zinit] -ne 0 ]]; then
  zinit ice depth=1
  zinit light romkatv/powerlevel10k
fi

# -----------------------------------------------------------------------------
# Completion System
# -----------------------------------------------------------------------------
# Homebrew-installed completions live here when the formula provides zsh support.
if [[ -n "${HOMEBREW_PREFIX:-}" && -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]]; then
  fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" "${fpath[@]}")
fi
# Remove stale completion paths from the disabled zsh-autocomplete plugin.
fpath=("${(@)fpath:#*marlonrichert---zsh-autocomplete*}")
typeset -U fpath

autoload -Uz compinit
compinit

# -----------------------------------------------------------------------------
# Shell Options
# -----------------------------------------------------------------------------
setopt AUTO_CD                 # Treat directory names as cd targets
setopt INTERACTIVE_COMMENTS    # Allow comments in interactive commands
setopt NO_CASE_GLOB            # Make glob matching case-insensitive
setopt COMPLETE_IN_WORD        # Complete from the cursor position
setopt AUTO_MENU               # Show completion menu on repeated tab

# -----------------------------------------------------------------------------
# Key Bindings
# -----------------------------------------------------------------------------
# Ctrl+P: Search backward in command history
bindkey '^p' history-search-backward
# Ctrl+N: Search forward in command history
bindkey '^n' history-search-forward

# -----------------------------------------------------------------------------
# Zsh History Configuration
# -----------------------------------------------------------------------------
# Comprehensive history management for better command recall
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
HISTDUP=erase

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

# -----------------------------------------------------------------------------
# Zinit Plugin Configuration
# -----------------------------------------------------------------------------
if (( $+functions[zinit] )); then
  # Background notifications for long-running commands
  # Shows desktop notification when command completes
  #zinit ice wait lucid
  #zinit snippet OMZP::bgnotify

  #zinit ice wait lucid
  #zinit light atuinsh/atuin

  # zinit ice wait lucid light-mode for \
  #     junegunn/fzf \
  #     src"shell/fzf.plugin.zsh"
  zinit light Aloxaf/fzf-tab


  #zinit ice lucid wait'0'
  #zinit light joshskidmore/zsh-fzf-history-search

  # Command not found suggestions (currently disabled)
  # Suggests package installation for missing commands
  # zinit ice wait lucid
  # zinit snippet OMZP::command-not-found

  # Auto-suggestions based on command history
  zinit ice wait lucid
  zinit light zsh-users/zsh-autosuggestions

  # Syntax highlighting for command line
  # Provides real-time syntax highlighting as you type
  zinit ice wait lucid
  zinit light zdharma-continuum/fast-syntax-highlighting

  # Shows aliases when you use the full command
  # zinit ice wait lucid
  # zinit light djui/alias-tips

  # Fuzzy tab completion with fzf integration
  # zinit ice wait lucid
  # zinit light Aloxaf/fzf-tab

  # Advanced autocompletion system disabled for Warp/P10k stability.
  # zinit ice wait lucid
  # zinit light marlonrichert/zsh-autocomplete

  # Load Oh My Zsh completion library for enhanced tab completion
  #zinit snippet OMZL::completion.zsh

  # Additional completion libraries (currently disabled)
  # zinit load "lib/completion", from:oh-my-zsh
fi

# -----------------------------------------------------------------------------
# Powerlevel10k Theme Customization
# -----------------------------------------------------------------------------
# Load personal Powerlevel10k configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -o interactive || ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Run `colorscript` manually when desired; startup output can interfere with
# Powerlevel10k instant prompt and Warp shell integration.

# -----------------------------------------------------------------------------
# Directory Navigation
# -----------------------------------------------------------------------------
# Keep zoxide as the final executable shell setup so its chpwd hook is not
# overwritten by later initialization.
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh --cmd cd)"
fi
