#!/bin/sh

# =============================================================================
# Package Installation Script
# =============================================================================
# This script installs essential packages and dependencies required for
# the dotfiles configuration. Run this script on a fresh system setup.

# -----------------------------------------------------------------------------
# System Dependencies
# -----------------------------------------------------------------------------
# Install Homebrew dependencies and build tools
sudo apt install -y build-essential curl file git

# -----------------------------------------------------------------------------
# Shell and Terminal Tools
# -----------------------------------------------------------------------------
# Essential shell and terminal utilities
sudo apt install -y zsh tmux vim

# -----------------------------------------------------------------------------
# Desktop Applications
# -----------------------------------------------------------------------------
# Terminal emulator with advanced features
sudo apt install -y tilix

# -----------------------------------------------------------------------------
# Node.js Global Packages
# -----------------------------------------------------------------------------
# Install useful Node.js command-line tools globally
npm install --global \
  fast-cli \          # Fast.com speed test CLI
  trash-cli \         # Safe file deletion to trash
  localtunnel \       # Expose local servers to internet
  http-server \       # Simple HTTP server
  typescript \        # TypeScript compiler
  aws-cdk             # AWS Cloud Development Kit

# -----------------------------------------------------------------------------
# Ruby Development Environment (Disabled)
# -----------------------------------------------------------------------------
# Uncomment the following line to install Ruby development dependencies
# sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# -----------------------------------------------------------------------------
# Snap Packages (Disabled)
# -----------------------------------------------------------------------------
# Popular applications available as snap packages
# Uncomment any of these to install:

# Media player
# sudo snap install vlc

# Messaging application
# sudo snap install telegram-desktop

# Code editor
# sudo snap install code --classic

# API development tool
# sudo snap install postman

# Text editor
# sudo snap install sublime-text --classic

# Team communication
# sudo snap install slack --classic

# Video calling
# sudo snap install skype --classic

# -----------------------------------------------------------------------------
# VS Code Extensions (Disabled)
# -----------------------------------------------------------------------------
# Install VS Code extensions from a list file
# Uncomment to enable (requires extensions.list file):
# cat extensions.list | grep -v '^#' | xargs -L1 code --install-extension