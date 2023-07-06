-- Neovim Configuration
-- by Dom Aquino
-- Updated - July 4, 2023

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

    -- Install NERDTree
    Plug 'preservim/nerdtree'

    -- Install gruvbox
    Plug 'morhetz/gruvbox'

    -- Install CoC
    Plug 'neoclide/coc.nvim'

    -- Install Zen mode
    Plug 'folke/zen-mode.nvim'

    -- Install devicons
    Plug 'ryanoasis/vim-devicons'

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

vim.opt.updatetime = 300                                 -- something to do about the coc
vim.opt.signcolumn = "yes"                               -- something to do about the coc

vim.cmd("colorscheme gruvbox")
vim.cmd("syntax on")

--------------
-- Mappings --
--------------
vim.keymap.set('n', '<S-j>', ':tabprevious<CR>')
vim.keymap.set('n', '<S-k>', ':tabnext<CR>')
vim.keymap.set('n', '<S-c>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>')
vim.keymap.set('n', '<C-n>', ':NERDTree<CR>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>')

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
-- Plugins Setup--
------------------
require('nvim-treesitter.configs').setup{
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
}

require('lualine').setup{
    options = {
      icons_enabled = true,
      theme = 'gruvbox',
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

