" Most of this script are just copied from https://github.com/thoughtbot/dotfiles/
set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

set ruler
set showcmd

" Search
set hlsearch
set incsearch
" Clear hiligh of search matches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

colorscheme molokai
let g:molokai_original = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  " Bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
else
  " Bind K to grep word under cursor
  nnoremap K :grep! -r "\b<C-R><C-W>\b" .<CR>:cw<CR>
endif

" Number
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Quicker window movement
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l


runtime macros/matchit.vim
