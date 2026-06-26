" Bootstrap vim-plug
if has('nvim')
  let s:vim_site_dir = stdpath('data') . '/site'
  let s:plugged_dir = stdpath('data') . '/plugged'
else
  let s:vim_site_dir = expand('~/.vim')
  let s:plugged_dir = expand('~/.vim/plugged')
endif

let s:plug_file = s:vim_site_dir . '/autoload/plug.vim'
let s:plug_installed = 0

if empty(glob(s:plug_file))
  silent execute '!curl -fLo ' . shellescape(s:plug_file) . ' --create-dirs '
        \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let s:plug_installed = 1
endif

if filereadable(s:plug_file)
  execute 'source' fnameescape(s:plug_file)
  call plug#begin(s:plugged_dir)

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'

  " Initialize plugin system
  call plug#end()

  if s:plug_installed
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  echohl WarningMsg
  echom 'vim-plug is not installed; skipping plugin setup'
  echohl None
endif


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
if !has('nvim')
  set ttymouse=xterm2
endif
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
" Move backup and swap files out of project directories
if has('nvim')
  let s:session_dir = stdpath('state') . '/sessions'
else
  let s:session_dir = expand('~/.vim/sessions')
endif
call mkdir(s:session_dir, 'p')
let &backupdir = s:session_dir . '//'
let &directory = s:session_dir . '//'

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
