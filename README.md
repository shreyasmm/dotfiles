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
