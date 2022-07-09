" NVim Configuration
" by Dom Aquino
" Updated - July 9, 2022

call plug#begin()

" Install NERDTree
Plug 'preservim/nerdtree'

" Install lightline
Plug 'itchyny/lightline.vim'

" Install vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Install Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
"set termguicolors

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

lua << EOF
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "python", "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      --disable = { "c", "rust" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
}
EOF

