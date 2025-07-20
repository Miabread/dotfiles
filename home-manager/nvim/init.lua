-- Needs setup before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('miabread.keybinds')

vim.opt.mouse = '';
vim.opt.number = true;
vim.opt.relativenumber = true;

require('vscode').load()

vim.opt.showmode = false
require('lualine').setup {
    options = {
        theme = 'vscode',
    },
};

require('noice').setup {};
require('gitsigns').setup {};
