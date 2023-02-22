" NVim Configuration (Writing)
" by Dom Aquino
" Updated - February 22, 2023

call plug#begin()

    " Install gruvbox
    Plug 'morhetz/gruvbox'

    " Install Pencil
    Plug 'preservim/vim-pencil'

    " Install Zen mode
    Plug 'folke/zen-mode.nvim'

call plug#end()

syntax on
set background=dark
colorscheme gruvbox

" Basic keystrokes
nnoremap <S-j> :tabprevious<CR>
nnoremap <S-k> :tabnext<CR>
nnoremap <S-c> :noh<CR>
inoremap jk <Esc>

" Basic configurations
set spell spelllang=en_us

" Plugin-specific configurations
let g:pencil#textwidth = 90

lua << EOF
  require("zen-mode").setup {
    window = {
        height = 0.90,
        width = 100,
    }
  }
EOF

