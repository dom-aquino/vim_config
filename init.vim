" NVim Configuration
" by Dom Aquino
" Updated - July 10, 2022

call plug#begin()

" Install vim-go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Install Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Install lualine
Plug 'nvim-lualine/lualine.nvim'

" Install nvim-tabline
Plug 'crispgm/nvim-tabline'

" Install nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

" Install gruvbox
Plug 'morhetz/gruvbox'

" Install CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set background=dark
syntax on
colorscheme gruvbox

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
set termguicolors

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <S-j> :tabprevious<CR>
nnoremap <S-k> :tabnext<CR>
nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <C-t> :NvimTreeOpen<CR>
nnoremap <C-c> :NvimTreeClose<CR>
nnoremap <S-c> :noh<CR>

let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

autocmd FileType go nmap <C-d> <Plug>(go-doc)
autocmd FileType go nmap <C-f> <Plug>(go-def)

" CoC-specific configurations
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

lua << EOF
  require('nvim-treesitter.configs').setup{
    -- A list of parser names, or "all"
    ensure_installed = { "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = {},

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = {},

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'gruvbox',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
  require('tabline').setup({
    show_index = true,        -- show tab index
    show_modify = true,       -- show buffer modification indicator
    modify_indicator = '[+]', -- modify indicator
    no_name = '[No name]',    -- no name buffer name
  })
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
      icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = false
          },
      },
    },
    filters = {
      dotfiles = true,
    },
  })
EOF

