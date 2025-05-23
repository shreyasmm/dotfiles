# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

source $HOME/.dotfiles/shell/env.sh
source $HOME/.dotfiles/shell/alias.sh

#zinit
# Active bgnotify plugin
zinit ice wait lucid
zinit snippet OMZP::bgnotify

# Fast syntax highlighting
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

# Alias tips
zinit ice wait lucid
zinit light djui/alias-tips

# Autocomplete
zinit ice wait lucid
zinit light marlonrichert/zsh-autocomplete

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
zinit snippet OMZL::completion.zsh

# utility plugins
#zplug "lib/completion", from:oh-my-zsh

#/opt/shell-color-scripts/colorscript.sh random
colorscript random

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
