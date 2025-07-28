local telescope = require('telescope.builtin');
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' });
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' });
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' });
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' });
vim.keymap.set('n', '<leader>fn', require('telescope').extensions.notify.notify, { desc = 'Telescope notifications' });

