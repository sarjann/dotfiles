vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Alter copilot
vim.keymap.set("n", "<leader>cope", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>copd", ":Copilot disable<CR>")

-- Copy Paste Clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+gP')
vim.keymap.set("n", "<leader>p", '"+gP')

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Up Down
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
