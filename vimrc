" Screw VI!
set nocompatible

set nonumber
set ruler
syntax on

" Prompt for a command to run
"map rp :PromptVimTmuxCommand
" Run last command executed by RunVimTmuxCommand
"map rl :RunLastVimTmuxCommand
" Inspect runner pane
"map ri :InspectVimTmuxRunner
" Close all other tmux panes in current window
"map rx :CloseVimTmuxPanes
" Interrupt any command running in the runner pane
"map rs :InterruptVimTmuxRunner

" Make latex box compile on save
"let g:LatexBox_latexmk_options = "-pvc -pdfps"

" For Latex-suite; grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Turn off placeholder chars in latex docs
let g:Imap_UsePlaceHolders = 0

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Make it fast and beautiful! :D
set ttyfast
set term=screen-256color
set t_Co=256

" Change cursor based on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Encoding fix
set nobomb
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set sts=2
set sw=2

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" No more middle mouse random paste!
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1 " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1 " Rainbow parentheses'!

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" NERDTree configuration
"let NERDTreeIgnore=['\.rbc$', '\~$']
"map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" scss
au BufRead,BufNewFile *.scss set filetype=scss

" markdown folding
au FileType markdown syn region myMkdHeaderFold
        \ start="\v^\s*\z(\#{1,6})"
        \ skip="\v(\n\s*\z1\#)\@="
        \ end="\v\n(\s*\#)\@="ms=s-1,me=s-1
        \ fold contains=myMkdHeaderFold

au FileType markdown syn sync fromstart
au FileType markdown set foldmethod=syntax

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
" color desert
color molokai

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set guioptions=aAce