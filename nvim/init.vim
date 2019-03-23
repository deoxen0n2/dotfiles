" NeoBundle Scripts-----------------------------
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

" Most of this script are just copied from https://github.com/thoughtbot/dotfiles/
set nocompatible

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'cespare/vim-toml'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'fatih/vim-go.git'
NeoBundle 'fxn/vim-monochrome'
NeoBundle 'hauleth/blame.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kylef/apiblueprint.vim'
" NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mhartington/oceanic-next'
" NeoBundle 'mhartington/nvim-typescript'
NeoBundle 'moll/vim-node'
NeoBundle 'mtscout6/syntastic-local-eslint.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle "reedes/vim-colors-pencil"
NeoBundle 'mdempsky/gocode', { 'rtp': 'nvim/' }
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'shime/vim-livedown'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'zaki/zazen'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}

call neobundle#end()

NeoBundleCheck

" End NeoBundle Settings---------------------------

set clipboard+=unnamedplus

if (has("termguicolors"))
 set termguicolors
endif

syntax enable

" execute pathogen#infect()
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

" For Go
autocmd FileType go setlocal tabstop=8 shiftwidth=8
" autocmd FileType go map <C-[> :GoDoc<CR>

" let g:solarized_termcolors=256
" let g:solarized_termcolors=16
" set t_Co=256
" set termguicolors
set background=dark
" colorscheme solarized
colorscheme OceanicNext
" colorscheme grb256
" colorscheme base16-solarized-dark
" colorscheme NeoSolarized
" colorscheme monochrome
" colorscheme zazen

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
nnoremap <silent> <Leader>0 :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>9 :exe "resize " . (winheight(0) * 2/3)<CR>

" Set Ex command autocompletion to be more like bash shell
set wildmode=longest,list

runtime macros/matchit.vim

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Mocha (Node.js)
autocmd FileType javascript nnoremap <buffer> <Leader>s : !yarn start %<CR>
autocmd FileType javascript map <Leader>t :!NODE_ENV=test yarn test %<CR>
autocmd FileType javascript map <Leader>n :!node %<CR>

" Rust
set hidden
let g:racer_cmd = "/Users/deoxen0n2/.cargo/bin/racer"
let $RUST_SRC_PATH = "/usr/local/src/rust/src"

" SQL
" let g:sql_type_default = 'pgsql'

" Airline
set laststatus=2

" Syntastic
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_typescript_checkers = [ 'tsuquyomi' ]
let g:syntastic_javascript_checkers = [ 'eslint' ]
let g:syntastic_go_checkers = [ 'go', 'golint', 'govet', 'errcheck' ]
let g:go_highlight_functions = 1

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

set backspace=indent,eol,start
:autocmd FileType scss setlocal iskeyword+=\-
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi@balloonexpr()
autocmd FileType typescript nnoremap <buffer> <Leader>d : <C-u>echo tsuquyomi#hint()<CR>

" Markdown.
autocmd FileType markdown nnoremap <buffer> <Leader>x : .w !bash<CR>

" Nerdtree
" let g:NERDTreeHijackNetrw=0
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd vimenter * NERDTree
map <C-x> :NERDTreeToggle<CR>

" JSX
let g:jsx_ext_required = 0

" NVIM Python
let g:python2_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/bin/python3.5'
let g:python3_host_prog = '/usr/bin/python3.6'

" Utils
nnoremap ,z :let @*=expand("%")<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" vim-go
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
autocmd FileType go nnoremap <Leader>t <Plug>(go-test)

" vim-livedown
autocmd FileType markdown nnoremap gm :LivedownToggle<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
  \ }
let g:tagbar_width = 80

" cp will give current file relative path.
:nmap cp :let @+ = expand("%")<CR>
