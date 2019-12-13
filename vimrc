syntax on
set number relativenumber
set ruler
set cmdheight=1
set showmatch
set mat=2
"
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set lbr
set tw=500
set wrap
set cinwords=""
"
"
" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
"
"
""augroup numbertoggle
""	autocmd!
""	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber | endif
""	autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set norelativenumber | endif
""augroup END
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
"
set hlsearch
set incsearch
nnoremap <CR> :noh<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"for vim-gitgutter

"update signs faster
set updatetime=100

"show signcolumn when there are no signs
set signcolumn=yes

"plugin definitions for vim-plug
source ~/.vim/plugins.vim
