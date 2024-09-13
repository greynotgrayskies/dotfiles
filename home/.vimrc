runtime! debian.vim

"------------------------------------------------------------------------------
"""Syntax Highlighting, Font and Color Scheme"""
syntax on
colorscheme dark-peachpuff

"------------------------------------------------------------------------------
"""General Settings"""
set autoread
set autowrite
set noerrorbells

" Use swapfiles and store swapfiles in a specific directory, rather than the
" same directory as the edited file.
set swapfile
set directory=~/.vim/swapfiles//

"""Navigation"""
set nu
set scrolloff=5
set mouse=a
set mousehide

"""Search"""
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

"""Tabs and Indentation"""
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent

"""Text Formatting"""
"Set line width to 80
set textwidth=80
set colorcolumn=81
hi ColorColumn ctermbg=blue
set formatoptions=q

"Show tabs and trailing spaces.
set list
set listchars=trail:_,tab:>>


"------------------------------------------------------------------------------
"LaTeX
"TODO:
" - Move over to tex.vim

"Wrap lines over 80 characters long
"autocmd BufEnter,BufRead *.tex setlocal textwidth=80

"No auto-indentation
autocmd BufEnter,BufRead *.tex setlocal noai nocin nosi inde=

"------------------------------------------------------------------------------
"""Keyboard shortcuts"""

"Map Ctrl+backspace in insert mode to delete word.
inoremap <C-H> <C-W>

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

