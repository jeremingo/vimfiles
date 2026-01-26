" map leader to space
let mapleader = " "

" syntax highlighting
syntax on

" relative number lines and absolute line number on curser
set number relativenumber

" hidden buffers for easy switching
set hidden

" cursorline
set cursorline

" keep curser two lines from top and bottom
set scrolloff=2

" show matching bracket
set showmatch
set matchtime=2

"
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" auto indent
set autoindent
set smartindent
set linebreak
set textwidth=500
set wrap
set cinwords=""

" short ttimeoutlen for slow esc and maps
set ttimeoutlen=50

"
set wildmenu
"
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
"
set ignorecase
set smartcase

" highlight search results as search typed in cmd line
set hlsearch
set incsearch

" open file in last curser location
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" for vim-gitgutter

" update signs faster
set updatetime=100

" show signcolumn when there are no signs
set signcolumn=yes

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin definitions for vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-python/python-syntax'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'ying17zi/vim-live-latex-preview'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'instant-markdown/vim-instant-markdown', { 'for': 'markdown', 'do': 'yarn install' }

call plug#end()

let g:gruvbox_italic=1

" colorscheme
colorscheme gruvbox
set background=dark
set termguicolors

" set foreground and background colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" for lightline.vim

" show status line
set laststatus=2

nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>e :Files<cr>
nnoremap <silent> <leader>r :!clear && %:p<CR>
nnoremap <silent> <leader>w :w<CR>

" no need to show mode in cmd line
set noshowmode

" set fzf layout to down
let g:fzf_layout={'down': '40%'}

" set fzf colors to match colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" colorscheme
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ }

" for python-syntax

let g:python_highlight_all = 1

" for vim-live-latex-preview

execute pathogen#infect()
filetype plugin indent on

" for vimtex

let g:tex_flavor = 'latex'

set keymap=tair
set iminsert=0

nnoremap <silent> <F6> a<C-^><ESC>:set rightleft!<CR>
inoremap <silent> <F6> <C-^><C-O>:set rightleft!<CR>

autocmd FileType gitcommit call s:PrefixGitCommit()

function! s:PrefixGitCommit()
  let l:noncomment = filter(filter(getline(1, 'S'), 'v:val !~ "^\h*$"'), 'v:val !~ "^\h*#"')

  if !empty(l:noncomment)
    return
  endif

  let l:branch = system('git rev-parse --abbrev-ref HEAD')
  let l:branch = substitute(l:branch, '\n', '', '')

  let l:issue = matchstr(l:branch, '\v^\d+')

  if !empty(l:issue)
    call append(0, 'gh-'.l:issue.' ')
    call cursor(1, 1)
  endif
endfunction
