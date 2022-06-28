" Vim Configuration
" by Dom Aquino
" Updated - 06-28-2022

call plug#begin()

" Install NERDTree
Plug 'preservim/nerdtree'

" Install lightline
Plug 'itchyny/lightline.vim'

call plug#end()

syntax enable
set background=dark

syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab
set number
set nowrap
set noswapfile
set nobackup
set list
set listchars=eol:$,tab:>>,trail:.
set laststatus=2
set colorcolumn=80
set noshowmode
set noshowcmd

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <S-j> :tabprevious<CR>
nnoremap <S-k> :tabnext<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

