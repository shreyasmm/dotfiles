#!/bin/sh

# Utilities
alias week='date +%V'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias webserver="python -m http.server"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias c='clear'
alias ramdisk="sudo mount -t tmpfs tmpfs /home/shrey/Others/ramdisk -o size=2048m"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias free='free -m'
alias df='df -h'

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias H='| head'
alias T='| tail'
alias G='| grep'
alias L="| less"

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias awsssh="aws ssm start-session --target"

alias vim='nvim'
alias ls='lsd'
alias cat='bat'
alias update='npm -g update && brew upgrade && sudo dnf update && flatpak update'
