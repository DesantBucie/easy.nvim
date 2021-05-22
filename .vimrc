set completeopt=longest,menuone
set number
syntax on
set mouse=a
"set hlsearch
set shiftround
set smarttab
set smartcase
set ignorecase
set encoding=utf-8
set wrap
set linebreak
set display+=lastline
set scrolloff=1
set sidescrolloff=5
set laststatus=2
set ruler
set wildmenu
set cursorline
set noerrorbells
set title
set background=dark
set nocompatible
set noswapfile
set incsearch
set showcmd
set viminfo='0,:0,<0,@0,f0
set nobackup
set nowb
set autoread
set showmatch
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set clipboard=unnamed
set autochdir
"let mapleader = ','
let g:netrw_keepdir = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
map <leader>t :tabe <CR>
map <leader>s :vsplit<CR>
nnoremap <tab> <C-W>w
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
function! ToggleVExplorer()
        Lexplore
        vertical resize 30
endfunction
map <silent> <leader>n :call ToggleVExplorer()<CR>
