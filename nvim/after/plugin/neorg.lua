-- local neorg_callbacks = require("neorg.core.callbacks")
--
-- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
--     -- Map all the below keybinds only when the "norg" mode is active
--     keybinds.map_event_to_mode("norg", {
--         n = { -- Bind keys in normal mode
--             { "<C-s>", "core.integrations.telescope.find_linkable" },
--         },
--
--         i = { -- Bind in insert mode
--             { "<C-l>", "core.integrations.telescope.insert_link" },
--             { "<C-f>", "core.integrations.telescope.insert_file_link" },
--         },
--     }, {
--         silent = true,
--         noremap = true,
--     })
-- end)
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--     pattern = { "*.norg" },
--     command = "set conceallevel=3"
-- })
