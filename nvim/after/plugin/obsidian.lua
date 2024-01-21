local obsidian = require("obsidian")
obsidian.setup({
    dir = "~/obsidian/home",
    workspaces = {
        {
            name = "home",
            path = "~/obsidian/home",
        },
        {
            name = "work",
            path = "~/obsidian/work",
        },
    },
    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "notes/dailies"
    },
    -- Optional, completion.
    completion = {
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "current_dir",

        -- Whether to add the output of the node_id_func to new notes in autocompletion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        prepend_note_id = true
    },
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart({"open", url})  -- Mac OS
        vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a prefix.
        -- In this case a note with the title 'My new note' will given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local prefix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the prefix.
            for _ = 1, 4 do
                prefix = prefix .. string.char(math.random(65, 90))
            end
        end
        return tostring(prefix .. "-" .. os.time())
    end,
})

function _G.rename_obsidian_note()
    local note_name = vim.fn.input("Enter variable name: ")
    vim.cmd("ObsidianRename " .. note_name)
end

function _G.new_obsidian_note()
    local note_name = vim.fn.input("Enter variable name: ")
    vim.cmd("ObsidianNew " .. note_name)
end

vim.api.nvim_set_keymap('n', '<C-g>g', '<cmd>ObsidianQuickSwitch<cr>',
    { noremap = true, silent = true, desc = "Search Notes" })
vim.api.nvim_set_keymap('n', '<C-g>n', ':lua new_obsidian_note()<cr>',
    { noremap = true, silent = true, desc = "Create Notes" })
vim.api.nvim_set_keymap('n', '<C-g>o', '<cmd>ObsidianOpen<cr>', { noremap = true, silent = true, desc = "Open Notes" })
vim.api.nvim_set_keymap('n', '<C-g>r', ':lua rename_obsidian_note()<cr>',
    { noremap = true, silent = true, desc = "Rename Notes" })
