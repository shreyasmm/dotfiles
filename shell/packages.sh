#!/bin/sh

# Package Installation Script
# This script installs essential packages and dependencies required for
# the dotfiles configuration. Run this script on a fresh system setup.


# Node.js Global Packages
# Install useful Node.js command-line tools globally
npm install --global \
  fast-cli \          # Fast.com speed test CLI
  trash-cli \         # Safe file deletion to trash
  localtunnel \       # Expose local servers to internet
  http-server \       # Simple HTTP server
  typescript \        # TypeScript compiler
  aws-cdk             # AWS Cloud Development Kit

## Flatpak Applications
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.videolan.VLC
flatpak install flathub com.transmissionbt.Transmission
