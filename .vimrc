" Vim Configuration
" By Dom Aquino
" June 2021

" START OF VUNDLE SETUP 
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Install NERDTree
Plugin 'preservim/nerdtree'

" Install gruvbox
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

" END OF VUNDLE SETUP

syntax on                              " syntax highlighting
set tabstop=4                          " set tab key as four spaces
set shiftwidth=4                       " set width as four spaces
set expandtab                          " convert tab to spaces 
set autoindent                         " auto indentation, based on previous lines
set number                             " show line number
set nowrap                             " texts will not be wrapped once it's past the screen
set laststatus=2                       " display file location
set noswapfile                         " prevent swap files from being created
set nobackup                           " prevent backup files from being created
set list                               " set list
set listchars=eol:$,tab:>>,trail:.     " render chars for EOL, tab, and trailing spaces
set colorcolumn=80

" Tab switching
noremap <S-J> :tabprevious<cr>
noremap <S-K> :tabnext<cr>

" NERDTree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

