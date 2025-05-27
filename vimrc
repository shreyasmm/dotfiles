" Bootstrap Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'




" Initialize plugin system
call plug#end()


set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'Raimondi/delimitMate.git'
"Bundle 'scrooloose/nerdtree.git'
"Bundle 'docunext/closetag.vim.git'
"Bundle 'scrooloose/syntastic.git'

"Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
"call vundle#end()            " required


"Airline Settings
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='badwolf'
set noshowmode

"Vim Settings
set t_Co=256              " Enable Full Color Support
"colors xoria256
set mouse=a
set ttymouse=xterm2
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text"
set enc=utf-8             " utf-8 default encoding
syntax on                 " Enable Syntax Highlighting
set cursorline            " Highlight the currient line
set spelllang=en_us            " Set the spellchecking language"
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘
"set background=dark        " Dark background
set expandtab             " Expand tabs to spaces
" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F
set tabstop=8

" ; is an alias for :
nnoremap ; :
nnoremap y y$
nmap <leader>w :w!<cr>
imap jj <esc>
" Make syntastic auto update the location list and make it also check
" when the file opens
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_check_on_open=1


"" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter
set scrolloff=3 " don't show search results as the first line

"nerdtree settings
let g:NERDTreeMouseMode = 2

"statusline
"set statusline =%#identifier#
"set statusline+=[%t] "tail of the filename
"set statusline+=%*
map <C-n> :NERDTreeToggle<CR>
