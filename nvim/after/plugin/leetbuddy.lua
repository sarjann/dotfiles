vim.api.nvim_set_keymap('n', '<leader>lq', '<cmd>LBQuestions<cr>', { noremap = true, silent = true, desc = "List Questions" })
vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>LBQuestion<cr>', { noremap = true, silent = true, desc = "View Question" })
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>LBReset<cr>', { noremap = true, silent = true, desc = "Reset Code" })
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>LBTest<cr>', { noremap = true, silent = true, desc = "Run Code" })
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>LBSubmit<cr>', { noremap = true, silent = true, desc = "Submit Code" })

