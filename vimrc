" syntax highlighting
syntax on

" relative number lines and absolute line number on curser
set number relativenumber

" line and column number on bottom
set ruler

" show command on bottom
set showcmd

" height of cmd line
set cmdheight=1
 
" show matching bracket
set showmatch

"
set mat=2

"
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" auto indent
set ai
set si
set lbr
set tw=500
set wrap
set cinwords=""


" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

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

" map enter to set no highlight
nnoremap <CR> :nohlsearch<CR>

" open file in last curser location
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" for vim-gitgutter

" update signs faster
set updatetime=100

" show signcolumn when there are no signs
set signcolumn=yes

" for vim-subversive

" map s
nmap s <plug>(SubversiveSubstituteRange)

" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" plugin definitions for vim-plug
source ~/.vim/plugins.vim

" colorscheme
colorscheme jellybeans
set background=dark

" for vim-gitgutter

" highlight to default colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
