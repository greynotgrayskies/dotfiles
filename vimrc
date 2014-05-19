runtime! debian.vim

"------------------------------------------------------------------------------
"""Syntax Highlighting, Font and Color Scheme"""
syntax on

"------------------------------------------------------------------------------
"""General Settings"""
set autoread
set autowrite
set noerrorbells
"filetype plugin indent on

"Dimensions
set lines=50
set columns=80
set textwidth=80

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
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

"autocmd FileType javascript set tabstop=2
"autocmd FileType javascript set shiftwidth=2
