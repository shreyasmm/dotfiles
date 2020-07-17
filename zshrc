source $HOME/.dotfiles/shell/env.sh
source $HOME/.dotfiles/shell/alias.sh

# self update
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# program plugins
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh

# utility plugins
zplug "plugins/bgnotify", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-autosuggestions", from:github, defer:2
zplug "lib/completion", from:oh-my-zsh
zplug "lib/fzf", from:oh-my-zsh
zplug "lib/nvm", from:oh-my-zsh
zplug "djui/alias-tips"
zplug "plugins/kubectl", from:oh-my-zsh
# theme
zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme

# install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose


if [ /snap/bin/kubectl ]; then source <(kubectl completion zsh); fi
