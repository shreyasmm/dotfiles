
source $HOME/.env
source $HOME/.alias
source $HOME/.functions
# ZSH_DISABLE_COMPFIX=true
# antigen
source $HOME/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# oh-my-zsh's plugins
antigen-bundle bgnotify
antigen-bundle git
antigen-bundle common-aliases
antigen bundle command-not-found
antigen-bundle git-extras
antigen-bundle web-search
antigen-bundle colorize
antigen-bundle sudo
antigen-bundle rails
antigen-bundle ruby
antigen-bundle npm
antigen-bundle bower
antigen-bundle gem
antigen-bundle docker
antigen-bundle history
antigen-bundle systemadmin

# Other bundles
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle tarruda/zsh-autosuggestions

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen-apply


#autoload predict-on
#predict-on

