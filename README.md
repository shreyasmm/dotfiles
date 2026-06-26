# ✨ Dotfiles

> 🏠 A carefully crafted collection of personal dotfiles for a consistent development environment across all platforms

[![Platform Support](https://img.shields.io/badge/platforms-macOS%20%7C%20Ubuntu%20%7C%20Fedora%20%7C%20WSL-blue)](#-platform-support)
[![Shell](https://img.shields.io/badge/shell-zsh-green)](https://www.zsh.org/)
[![License](https://img.shields.io/badge/license-MIT-orange)](LICENSE)

---

## 🚀 Quick Setup

### 🔧 One-Command Setup
```bash
git clone --recursive https://github.com/shreyasmm/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
```

---

## 📋 Platform Support

<details>
<summary><strong>🍎 macOS</strong></summary>

### Prerequisites
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Setup
```bash
# Install system packages
brew bundle install --file=~/.dotfiles/Brewfile

# Run initialization
bash ~/.dotfiles/shell/init.sh

# Install Node.js packages (optional)
bash ~/.dotfiles/shell/packages.sh
```
</details>

<details>
<summary><strong>🐧 Ubuntu/Debian</strong></summary>

### Prerequisites
```bash
# Update package lists
sudo apt update && sudo apt upgrade -y
```

### Setup
```bash
# Install system packages
bash ~/.dotfiles/shell/packages.sh

# Install Homebrew (recommended for consistent package management)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file=~/.dotfiles/Brewfile

# Initialize environment
bash ~/.dotfiles/shell/init.sh
```
</details>

<details>
<summary><strong>🎩 Fedora/RHEL</strong></summary>

### Prerequisites
```bash
# Update system packages
sudo dnf update -y
sudo dnf install -y curl git build-essential
```

### Setup
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
brew bundle install --file=~/.dotfiles/Brewfile

# Initialize environment
bash ~/.dotfiles/shell/init.sh

# Install additional tools
sudo dnf install -y zsh tmux vim tilix
```
</details>

<details>
<summary><strong>🪟 Windows (WSL)</strong></summary>

### Prerequisites
```bash
# Update packages
sudo apt update && sudo apt upgrade -y

# Install Windows Terminal from Microsoft Store (recommended)
```

### Setup
```bash
# Install system packages
bash ~/.dotfiles/shell/packages.sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file=~/.dotfiles/Brewfile

# Initialize environment  
bash ~/.dotfiles/shell/init.sh
```
</details>

---

## 🔗 Create Symbolic Links

```bash
# 🐚 Shell Configuration
ln -sf ~/.dotfiles/zshrc ~/.zshrc

# ✏️  Editor Configuration
ln -sf ~/.dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# 🖥️  Terminal Multiplexer
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/submodules/tmux ~/.tmux

# 📝 Git Configuration
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig

# 💎 Ruby Configuration
ln -sf ~/.dotfiles/gemrc ~/.gemrc

# 👻 Ghostty Terminal (if using)
mkdir -p ~/.config/ghostty
ln -sf ~/.dotfiles/ghostty.config ~/.config/ghostty/config
```

---

## 🎨 Final Touches

### 🔌 Install Tmux Plugins
```bash
# Start tmux and install plugins
tmux new-session -d
tmux send-keys 'C-a' 'I'
```

### ✏️ Neovim Plugins
Neovim loads `~/.config/nvim/init.vim`, which sources `~/.dotfiles/vimrc`.
On first launch, the config bootstraps `vim-plug` into Neovim's data directory
and installs the configured plugins automatically.

```bash
nvim
```

### 🔄 Reload Configuration
```bash
# Reload shell configuration
source ~/.zshrc
```

### 🎭 Font Setup
1. Download a [**Nerd Font**](https://github.com/ryanoasis/nerd-fonts) (recommended: `FiraCode Nerd Font`)
2. Install the font on your system
3. Set it as your terminal's default font
4. Enjoy beautiful icons and symbols! ✨

---

## 📦 What's Included

### 🛠️ Development Tools
- **Languages**: Go, Node.js, TypeScript, Ruby (rbenv)
- **Cloud/DevOps**: AWS CLI, Kubernetes, Helm, Docker utilities
- **File Management**: `bat`, `lsd`, `tree`, `rclone`
- **Productivity**: `jq`, `httpie`, `aria2`

### 🎯 Shell Enhancements
- **Zsh** with modern plugins via Zinit
- **Tmux** with sensible defaults and plugins
- **Neovim/Vim** with essential configurations
- **Colorful scripts** for terminal aesthetics

### 🌈 Terminal Experience
- Beautiful color schemes
- Enhanced `ls` with `lsd`
- Better `cat` with `bat`
- Smart aliases and functions
- Cross-platform consistency

---

## 🎛️ Customization

### 🔧 Personal Git Configuration
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 🔑 SSH Key Setup
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
cat ~/.ssh/id_ed25519.pub
```

### 🎨 Terminal Themes
The dotfiles include beautiful color scripts. Try them out:
```bash
colorscript -r  # Random color script
colorscript -e square  # Specific script
```

---

## 🆘 Troubleshooting

<details>
<summary><strong>❓ Common Issues</strong></summary>

**Shell not changing to Zsh?**
```bash
chsh -s $(which zsh)
```

**Homebrew not found?**
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc  # macOS
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc  # Linux
```

**Tmux plugins not working?**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```

**Neovim plugins not working?**
```bash
nvim +'PlugInstall --sync' +qa
```

</details>

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  <sub>Made with ❤️ for developers who care about their environment</sub>
</div>
