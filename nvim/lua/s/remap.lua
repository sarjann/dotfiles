vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Alter copilot
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")

-- Copy Paste Clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>pp", '"+gP')
vim.keymap.set("n", "<leader>pp", '"+gP')

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Up Down
vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Other
vim.keymap.set("n", "Q", "<nop>")

-- Format
vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format()
end)

-- Save (Also W allowed as often shift is held when using ;)
vim.keymap.set("n", "<leader>w", function()
    vim.cmd("w")
end)
vim.cmd("command! W :w", { noremap = true, silent = true })

-- Tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
