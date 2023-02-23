" NVim Configuration
" by Dom Aquino
" Updated - February 22, 2023

call plug#begin()

    " Install vim-go
    Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

    " Install Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'

    " Install lualine
    Plug 'nvim-lualine/lualine.nvim'

    " Install nvim-tabline
    Plug 'crispgm/nvim-tabline'

    " Install NERDTree
    Plug 'preservim/nerdtree'

    " Install gruvbox
    Plug 'morhetz/gruvbox'

    " Install CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Install Zen mode
    Plug 'folke/zen-mode.nvim'

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
set ignorecase
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:NERDTreeShowHidden = 1

" Basic keystrokes
    nnoremap <S-j> :tabprevious<CR>
    nnoremap <S-k> :tabnext<CR>
    nnoremap <S-c> :noh<CR>
    inoremap jk <Esc>

" NERDTree
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <C-t> :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>

" ZenMode
    nnoremap zm :ZenMode<CR>

" Start NERDTree when Vim is started without file arguments.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Vim-Go
    autocmd FileType go nmap <C-d> <Plug>(go-doc)
    autocmd FileType go nmap <C-f> <Plug>(go-def)

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ CheckBackspace() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Tabs are 2 spaces for html and javascript files
autocmd BufRead,BufNewFile *.htm,*.html,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2

autocmd BufRead *.txt setlocal colorcolumn= wrap linebreak breakindent nonumber

lua << EOF

  require('nvim-treesitter.configs').setup{
    -- A list of parser names, or "all"
    ensure_installed = { "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

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

  require("zen-mode").setup {
      window = {
          height = 0.90,
          width = 90,
      },
  }

EOF

