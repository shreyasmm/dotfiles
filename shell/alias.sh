#!/bin/sh

# Utilities
alias week='date +%V'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias webserver="python -m SimpleHTTPServer"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias c='clear'
alias ramdisk="sudo mount -t tmpfs tmpfs /home/shrey/Others/ramdisk -o size=2048m"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"

# fun
alias starwars="telnet towel.blinkenlights.nl"
alias nyan='nc -v nyancat.dakko.us 23'

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'

alias ls='lsd'

