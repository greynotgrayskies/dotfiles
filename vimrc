runtime! debian.vim

"------------------------------------------------------------------------------
"""Syntax Highlighting, Font and Color Scheme"""
syntax on

"------------------------------------------------------------------------------
"""General Settings"""
set autoread
set autowrite
set noerrorbells
set noswapfile

"Dimensions
"set lines=50
"set columns=80

"Navigation
set nu
set scrolloff=5
set mouse=a
set mousehide

"Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

"Tabs and Indentation
filetype plugin indent on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

"------------------------------------------------------------------------------
"LaTeX
"TODO:
" - Move over to tex.vim

"Wrap lines over 80 characters long
"autocmd BufEnter,BufRead *.tex setlocal textwidth=80

"No auto-indentation
autocmd BufEnter,BufRead *.tex setlocal noai nocin nosi inde=

"------------------------------------------------------------------------------
"Buffer Management

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <bar><bar> :vsplit 
nnoremap __ :split 
nnoremap = :bnext<return>
nnoremap - :bprev<return>
nnoremap ++ :edit 
nnoremap <del><del> :bp\|bd #<return>

"Filetypes"
au BufRead,BufNewFile *.md set filetype=markdown

