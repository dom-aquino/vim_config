-- Neovim Configuration
-- by Dom Aquino
-- Updated - February 7, 2025

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-------------
-- Plugins --
-------------
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

    -- Install Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'

    -- Install lualine
    Plug 'nvim-lualine/lualine.nvim'

    -- Install nvim-tabline
    Plug 'crispgm/nvim-tabline'

    -- Install nvim-tree
    Plug 'nvim-tree/nvim-tree.lua'

    -- Install devicons for nvim-tree
    Plug 'nvim-tree/nvim-web-devicons'

    -- Install gruvbox
    Plug 'gruvbox-community/gruvbox'

    -- Install CoC
    Plug 'neoclide/coc.nvim'

    -- Install Zen mode
    Plug 'folke/zen-mode.nvim'

    -- Install devicons
    Plug 'ryanoasis/vim-devicons'

    -- Install zen mode
    Plug 'folke/zen-mode.nvim'

    -- Install plenary.nvim pre-requisite of telescope
    Plug 'nvim-lua/plenary.nvim'

    -- Install telescope
    Plug 'nvim-telescope/telescope.nvim'

    -- Install evil robot
    Plug 'github/copilot.vim'

vim.call('plug#end')

-------------
-- Options --
-------------
vim.opt.tabstop = 4                                      -- width of a tab character
vim.opt.shiftwidth = 4                                   -- width of an indention
vim.opt.expandtab = true                                 -- tab key inserts spaces rather than a tab character
vim.opt.autoindent = true                                -- follow the indention of the current line
vim.opt.number = true                                    -- show line number
vim.opt.wrap = false                                     -- no word wrapping
vim.opt.swapfile = false                                 -- swap files will not be created
vim.opt.backup = false                                   -- backup files will not be created
vim.opt.colorcolumn = "80"                               -- display a vertical line at line 80
vim.opt.list = true                                      -- show invisible list of characters
vim.opt.listchars = {space = '.', tab = '>~', eol = '$'} -- define the list of characters to show
vim.opt.termguicolors = true                             -- show accurate colors
vim.opt.background = "dark"                              -- select dark theme
vim.opt.syntax = "on"                                    -- enable syntax coloring
vim.opt.updatetime = 300                                 -- something to do about the coc
vim.opt.signcolumn = "yes"                               -- something to do about the coc

vim.cmd("let g:gruvbox_contrast_dark = 'medium'")
vim.cmd("colorscheme gruvbox")
vim.cmd("let g:loaded_python3_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:loaded_node_provider = 0")
vim.cmd("let g:loaded_perl_provider = 0")

--------------
-- Mappings --
--------------
vim.keymap.set('n', '<S-j>', ':tabprevious<CR>')
vim.keymap.set('n', '<S-k>', ':tabnext<CR>')
vim.keymap.set('n', '<S-c>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', 'zm', ':ZenMode<CR>')
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':Telescope find_files<CR>')

-- CoC Setup
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

------------------
-- Autocommands --
------------------
vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.txt"},
    command = "setlocal colorcolumn= wrap linebreak breakindent nonumber nolist"
})

---------------
-- Functions --
---------------

------------------
-- Plugins Setup--
------------------

require("nvim-tree").setup()

require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
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
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require('tabline').setup({
    show_index = true,           -- show tab index
    show_modify = true,          -- show buffer modification indicator
    show_icon = true,            -- show file extension icon
    fnamemodify = ':t',          -- file name modifier
    modify_indicator = '[+]',    -- modify indicator
    no_name = 'No name',         -- no name buffer name
    brackets = { '[', ']' },     -- file name brackets surrounding
    inactive_tab_max_length = 0  -- max length of inactive tab titles, 0 to ignore
})

require('nvim-treesitter.configs').setup{
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}

require('zen-mode').setup{
    window = {
        width = 90,
        height = 40
    }
}

