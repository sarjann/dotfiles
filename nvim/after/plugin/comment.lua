local ft = require('Comment.ft')
local api = require('Comment.api')

ft({"hcl"}, ft.get("yaml"))

vim.keymap.set("i", "<C-_>", function() require(api).toggle.linewise.current() end,
    { noremap = true, silent = true })
vim.keymap.set("n", "<C-_>", function() require(api).toggle.linewise.current() end,
    { noremap = true, silent = true })
