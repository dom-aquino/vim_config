" Vim Configuration
" by Dom Aquino
" Updated - 06-28-2022

call plug#begin()

" Install NERDTree
Plug 'preservim/nerdtree'

" Install lightline
Plug 'itchyny/lightline.vim'

" Install vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
set laststatus=2
set colorcolumn=80
set noshowmode
set noshowcmd
set list
set listchars=eol:$,tab:..,trail:.
set encoding=utf-8
set completeopt-=preview

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <S-j> :tabprevious<CR>
nnoremap <S-k> :tabnext<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

autocmd FileType go nmap <C-d> <Plug>(go-doc)
autocmd FileType go nmap <C-f> <Plug>(go-def)

