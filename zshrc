# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.dotfiles/shell/env.sh
source $HOME/.dotfiles/shell/alias.sh

# self update
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# utility plugins
zplug "plugins/bgnotify", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-autosuggestions", from:github, defer:2
zplug "lib/completion", from:oh-my-zsh
zplug "djui/alias-tips"
#zplug "marlonrichert/zsh-autocomplete", as:plugin, from:github
#zplug "plugins/kubectl", from:oh-my-zsh

# theme
zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme

# install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

	
# if [ -f /opt/bash-insulter/src/bash.command-not-found ]; then
#     . /opt/bash-insulter/src/bash.command-not-found 
# fi
/opt/shell-color-scripts/colorscript.sh random

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
