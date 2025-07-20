-- Needs setup before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('miabread.keybinds')

vim.opt.mouse = ''; -- Disable mouse
vim.opt.number = true; -- Show line numbers
vim.opt.relativenumber = true; -- Show relative line numbers near cursor
vim.opt.cursorline = true; -- Highlight cursor line background

require('vscode').load()

vim.opt.showmode = false
require('lualine').setup {
    options = {
        theme = 'vscode',
    },
};

require('noice').setup {};
require('gitsigns').setup {};

require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  direction = 'float',
};
