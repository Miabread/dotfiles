-- Needs setup before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.mouse = '';

require('vscode').load()

vim.opt.showmode = false
require('lualine').setup {
    options = {
        theme = 'vscode',
    },
};
