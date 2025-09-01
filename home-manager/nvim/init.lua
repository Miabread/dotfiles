-- Needs setup before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('miabread.keybinds')

vim.opt.mouse = ''; -- Disable mouse
vim.opt.number = true; -- Show line numbers
vim.opt.relativenumber = true; -- Show relative line numbers near cursor
vim.opt.cursorline = true; -- Highlight cursor line background
vim.opt.scrolloff = 10; -- Always keep lines above cursor
vim.opt.expandtab = true; -- Replace tabs with spaces
vim.opt.tabstop = 4; -- Set tab width
vim.opt.shiftwidth = 4; -- Set autoindent width


require('vscode').load()

vim.opt.showmode = false
require('lualine').setup {
    options = {
        theme = 'vscode',
    },
};

require('noice').setup {};

vim.opt.signcolumn = 'yes:1';
require('gitsigns').setup {};

require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  direction = 'float',
};

require('notify').setup {};

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    },
};

require('ibl').setup {};

vim.diagnostic.config {
    virtual_lines = true,
};

vim.lsp.enable('rust_analyzer');

