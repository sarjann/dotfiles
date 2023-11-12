local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

local telescope = require('telescope')
telescope.load_extension('git_worktree')
vim.keymap.set('n', '<C-f>', telescope.extensions.git_worktree.create_git_worktree, {})
