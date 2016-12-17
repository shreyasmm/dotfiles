#Dotfiles
A collection of my personal dotfiles. Here's a little preview of what it can look like:
These files contain Configuration for
zsh,vim,tmux,gem,fstab,gitconfig,sublime text 3



##Installations
Your first step is to clone this repository:
    git clone --recursive https://github.com/MMShreyas/dotfiles.git .dotfiles

````
rm -r .vim .vimrc .zshrc .gitconfig
ln -s .dotfiles/vim .vim
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/gemrc .gemrc
ln -s .dotfiles/alias .alias
ln -s .dotfiles/zshrc .zshrc
ln -s .dotfiles/gitconfig .gitconfig
ln -s .dotfiles/env .env
````

##Usage
open vim and run :PluginInstall
open tmux and press Ctrl + a and I to start installations of plugins

##Licence
GPL3
