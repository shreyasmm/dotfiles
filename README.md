# Dotfiles
A collection of my personal dotfiles. Here's a little preview of what it can look like:
These files contain Configuration for zsh, vim, tmux, gem, fstab, gitconfig, sublime text 3

## Installations
1. Clone repository:

````
git clone --recursive https://github.com/shreyasmm/dotfiles.git .dotfiles
````

````
rm -r .vim .vimrc .zshrc .gitconfig
ln -s .dotfiles/vim .vim
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/gemrc .gemrc
ln -s .dotfiles/alias .alias
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/gitconfig .gitconfig
ln -s .dotfiles/env .env
ln -s .dotfiles/rbenv .rbenv
ln -s .dotfiles/brew .linuxbrew 
````
2. Download any Terminal font from [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and set it as default terminal font
3. Open vim and run :PluginInstall
4. Open tmux and press Ctrl + a and I to start installations of plugins

## Licence
GPL3
