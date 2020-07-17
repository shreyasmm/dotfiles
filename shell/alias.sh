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
# fun
alias starwars="telnet towel.blinkenlights.nl"
alias nyan='nc -v nyancat.dakko.us 23'

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'

# Kubernetes Shell Completion
# ls
alias ls='lsd'
