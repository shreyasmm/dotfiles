#!/bin/bash

# =============================================================================
# 🚀 Dotfiles Initialization Script
# =============================================================================
# This script performs complete setup of dotfiles on a new system.
# Run this once after cloning the repository for full automated setup.

set -e  # Exit on any error

DOTFILES_DIR="$HOME/.dotfiles"
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}${BOLD}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}${BOLD}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}${BOLD}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}${BOLD}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

print_status "🎯 Starting dotfiles initialization..."

# -----------------------------------------------------------------------------
# 🍺 Homebrew Installation
# -----------------------------------------------------------------------------
print_status "📦 Setting up Homebrew..."

if ! command_exists brew; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    
    print_success "Homebrew installed successfully!"
else
    print_success "Homebrew already installed!"
fi

# -----------------------------------------------------------------------------
# 📦 Install Homebrew Packages
# -----------------------------------------------------------------------------
print_status "📋 Installing Homebrew packages..."

if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
    cd "$DOTFILES_DIR"
    brew bundle install --file="$DOTFILES_DIR/Brewfile"
    print_success "Homebrew packages installed!"
else
    print_warning "Brewfile not found, skipping Homebrew package installation"
fi

# -----------------------------------------------------------------------------
# 🔗 Create Symbolic Links
# -----------------------------------------------------------------------------
print_status "🔗 Creating symbolic links..."

# Shell Configuration
if [[ -f "$DOTFILES_DIR/zshrc" ]]; then
    ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
    print_success "Zsh configuration linked"
fi

# Editor Configuration
if [[ -f "$DOTFILES_DIR/vimrc" ]]; then
    ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
    print_success "Vim configuration linked"
fi

# Terminal Multiplexer
if [[ -f "$DOTFILES_DIR/tmux.conf" ]]; then
    ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
    print_success "Tmux configuration linked"
fi

if [[ -d "$DOTFILES_DIR/submodules/tmux" ]]; then
    ln -sf "$DOTFILES_DIR/submodules/tmux" "$HOME/.tmux"
    print_success "Tmux plugins directory linked"
fi

# Git Configuration
if [[ -f "$DOTFILES_DIR/gitconfig" ]]; then
    ln -sf "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
    print_success "Git configuration linked"
fi

# Ruby Configuration
if [[ -f "$DOTFILES_DIR/gemrc" ]]; then
    ln -sf "$DOTFILES_DIR/gemrc" "$HOME/.gemrc"
    print_success "Ruby Gem configuration linked"
fi

# Ghostty Terminal Configuration
if [[ -f "$DOTFILES_DIR/ghostty.config" ]]; then
    mkdir -p "$HOME/.config/ghostty"
    ln -sf "$DOTFILES_DIR/ghostty.config" "$HOME/.config/ghostty/config"
    print_success "Ghostty configuration linked"
fi

# -----------------------------------------------------------------------------
# 📁 Directory Setup
# -----------------------------------------------------------------------------
print_status "📁 Setting up directories..."

# Create ramdisk directory for high-speed temporary storage
mkdir -p ~/Others/ramdisk
print_success "Ramdisk directory created"

# -----------------------------------------------------------------------------
# 🐚 Shell Configuration
# -----------------------------------------------------------------------------
print_status "🐚 Configuring shell..."

# Install zsh if not present
if ! command_exists zsh; then
    print_status "Installing zsh..."
    if command_exists apt; then
        sudo apt install -y zsh
    elif command_exists dnf; then
        sudo dnf install -y zsh
    elif command_exists brew; then
        brew install zsh
    fi
fi

# Change default shell to zsh
if [[ "$SHELL" != "$(which zsh)" ]]; then
    print_status "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
    print_success "Default shell changed to zsh (restart terminal to take effect)"
else
    print_success "Zsh is already the default shell"
fi

# -----------------------------------------------------------------------------
# 🔌 Tmux Plugin Setup
# -----------------------------------------------------------------------------
print_status "🔌 Setting up Tmux plugins..."

if command_exists tmux; then
    # Install TPM if not present
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        print_status "Installing Tmux Plugin Manager..."
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
        print_success "TPM installed"
    fi
    
    # Install tmux plugins
    print_status "Installing tmux plugins..."
    if tmux list-sessions >/dev/null 2>&1; then
        tmux send-keys 'C-a' 'I'
    else
        tmux new-session -d -s init_session
        sleep 1
        tmux send-keys -t init_session 'C-a' 'I'
        sleep 2
        tmux kill-session -t init_session
    fi
    print_success "Tmux plugins installed"
else
    print_warning "Tmux not found, skipping plugin setup"
fi

# -----------------------------------------------------------------------------
# 📦 Additional System Packages
# -----------------------------------------------------------------------------
print_status "📦 Installing additional system packages..."

if [[ -f "$DOTFILES_DIR/shell/packages.sh" ]]; then
    bash "$DOTFILES_DIR/shell/packages.sh"
    print_success "Additional packages installed"
fi

# -----------------------------------------------------------------------------
# 🎨 Color Scripts Setup
# -----------------------------------------------------------------------------
print_status "🎨 Setting up color scripts..."

if [[ -d "$DOTFILES_DIR/submodules/shell-color-scripts" ]]; then
    cd "$DOTFILES_DIR/submodules/shell-color-scripts"
    if command_exists make; then
        sudo make install >/dev/null 2>&1 || print_warning "Failed to install color scripts (may need sudo)"
    fi
    print_success "Color scripts ready"
fi

# -----------------------------------------------------------------------------
# ✅ Final Steps
# -----------------------------------------------------------------------------
print_status "✨ Finalizing setup..."

# Source zsh configuration if possible
if [[ -f "$HOME/.zshrc" ]]; then
    print_status "Sourcing zsh configuration..."
    # Note: This might not work perfectly in all environments
    zsh -c "source ~/.zshrc" 2>/dev/null || print_warning "Please restart your terminal or run 'source ~/.zshrc'"
fi

print_success "🎉 Dotfiles initialization complete!"
echo
print_status "📝 Next steps:"
echo "  1. 🔄 Restart your terminal or run 'source ~/.zshrc'"
echo "  2. 🎭 Install a Nerd Font from https://github.com/ryanoasis/nerd-fonts"
echo "  3. 🔧 Configure Git with your personal details:"
echo "     git config --global user.name 'Your Name'"
echo "     git config --global user.email 'your.email@example.com'"
echo "  4. 🔑 Set up SSH keys if needed:"
echo "     ssh-keygen -t ed25519 -C 'your.email@example.com'"
echo "  5. 🎨 Try color scripts: colorscript -r"
echo
print_success "🚀 Happy coding!"