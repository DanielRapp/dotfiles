" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'gmarik/github-search.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/powerline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'molokai'
Bundle 'Lokaltog/vim-powerline'

filetyp plugin indent on

imap %% $$<Esc>A<Space><Space>$$<Esc>hi
nmap <space> i <esc>r

set nocompatible
set nonumber
syntax on

set ttyfast
set term=screen-256color
set t_Co=256

" Encoding
set nobomb
set encoding=utf-8

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:\ \ ,trail:.
set sts=2
set sw=2

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Status bar
set laststatus=2

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Default color scheme
color molokai

set guioptions=aAce

" Git-gutter
highlight clear SignColumn
