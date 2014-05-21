set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

set ruler
set showcmd

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

colorscheme monokai

" Number
set number
set numberwidth=5

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
