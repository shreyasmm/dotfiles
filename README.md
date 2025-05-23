# Dotfiles
A collection of my personal dotfiles.

## Initialize the Dotfiles
`git clone --recursive https://github.com/shreyasmm/dotfiles.git .dotfiles`

```shell
# Zsh
ln -s .dotfiles/zshrc .zshrc

# Vim
ln -s .dotfiles/vimrc .vimrc

# tmux
ln -s .dotfiles/tmux.conf .tmux.conf
ln -s .dotfiles/submodules/tmux .tmux
# Open tmux and press Ctrl + a and I to start installations of plugins

# Git Config
ln -s .dotfiles/gitconfig .gitconfig

# Gem 
ln -s .dotfiles/gemrc .gemrc
```

## Install packages

`bash .dotfiles/shell/packages.sh`


## Install Brew Packages 
`brew bundle install --file=~/.dotfiles/Brewfile`

Download any Terminal font from [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and set it as default terminal font

## Managing Dotfiles

### Updating
To update your dotfiles and their submodules, run the following commands from your dotfiles directory (`~/.dotfiles`):
```shell
git pull origin master # Or your default branch
git submodule update --init --recursive
```

## Key Components

*   **Zsh:** Shell environment managed with `zshrc`. Plugin management is intended via `zinit` (Note: `zinit` submodule initialization encountered issues in the last automated review).
*   **Tmux:** Terminal multiplexer configured via `tmux.conf`. Plugins are managed by `tpm` (Tmux Plugin Manager), located in `submodules/tmux/plugins/tpm`. Remember to use `Ctrl+a I` in tmux to install new plugins.
*   **Vim:** Editor configured via `vimrc`.
*   **Package Management:** System packages are installed via `shell/packages.sh` (for Linux) and `Brewfile` (for macOS).
