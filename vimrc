" Most of this script are just copied from https://github.com/thoughtbot/dotfiles/
set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

" Change leader key
let mapleader=","

set ruler
set showcmd
set cursorline

set history=200

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" Clear hiligh of search matches
nnoremap <silent> L :<C-u>nohlsearch<CR><C-l>
" Count matches
nnoremap <silent> <leader>c :%s///gn<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set background=dark
colorscheme solarized

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
  nnoremap <leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
else
  " Bind K to grep word under cursor
  nnoremap <leader>k :grep! -r "\b<C-R><C-W>\b" .<CR>:cw<CR>
endif

" Number
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it better for scrolling command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Quicker window movement
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

" Quicker up-down movement
noremap <silent> J 10j
noremap <silent> K 10k

" Quicker buffer movement
nnoremap <leader><leader> <C-^>

" Quicker resize split width
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Set Ex command autocompletion to be more like bash shell
set wildmode=longest,list

runtime macros/matchit.vim

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Airline
set laststatus=2
