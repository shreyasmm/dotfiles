#!/bin/sh
# This script is primarily intended for Debian/Ubuntu-based Linux distributions.
# It uses 'apt' for system package management.

set -e

# Brew Dependencies
sudo apt install -y build-essential curl file git

# Shell Utilites
sudo apt install -y zsh tmux vim

# Utilites
sudo apt install -y tilix

# NPM Global Packages
npm install --global fast-cli trash-cli localtunnel http-server typescript aws-cdk

# Uncomment the following lines to install dependencies for Ruby on Rails development.
# Rails Installation
# sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev 

# Uncomment to install desired Snap packages
# Snaps
# sudo snap install vlc
# sudo snap install telegram-desktop
# sudo snap install code --classic
# sudo snap install postman
# sudo snap install sublime-text --classic
# sudo snap install slack --classic
# sudo snap install skype --classic

# Uncomment to install VSCode extensions listed in extensions.list (ensure file exists)
# vscode extentions
# cat extensions.list | grep -v '^#' | xargs -L1 code --install-extension
