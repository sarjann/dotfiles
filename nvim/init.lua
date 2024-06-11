require("s")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.o.runtimepath = vim.o.runtimepath .. ',' .. lazypath

--
-- vim.cmd('set runtimepath+=/home/s/repo/neovim/test_plugin')

local plugins = {
    { 'nvim-telescope/telescope.nvim',  version = '0.1.3', dependencies = { { 'nvim-lua/plenary.nvim' } } },
    {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({ replace_netrw = false })
            vim.api.nvim_set_keymap("n", "<leader>ef", "", {
                noremap = true,
                silent = true,
                callback = function()
                    require("ranger-nvim").open(true)
                end,
            })
        end,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/playground' },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            local autotag = require("nvim-ts-autotag")
            autotag.setup()
        end
    },
    { 'epwalsh/obsidian.nvim' },
    { 'folke/zen-mode.nvim' },
    { 'ThePrimeagen/harpoon', branch = "harpoon2", dependencies = { { "nvim-lua/plenary.nvim" } } },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'mfussenegger/nvim-dap' },
            { 'jay-babu/mason-nvim-dap.nvim' },
            { 'leoluz/nvim-dap-go' },
            { 'simrat39/rust-tools.nvim' },
            { 'mfussenegger/nvim-dap-python' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio" },
        config = function()
            local dapui = require("dapui")
            dapui.setup()
            dapui.close()
        end
    },
    {
        'Weissle/persistent-breakpoints.nvim',
        config = function()
            local pers_break = require("persistent-breakpoints")
            pers_break.setup {
                load_breakpoints_event = { "BufReadPost" }
            }
        end
    },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            local lualine = require('lualine')
            lualine.setup {
                options = {
                    theme = 'rose-pine'
                }
            }
        end
    },
    -- {
    --     'nvim-neorg/neorg',
    --     dependencies = { 'nvim-telescope/telescope.nvim' },
    --     build = ":Neorg sync-parsers",
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.completion"] = {
    --                     config = {
    --                         engine = "nvim-cmp",
    --                     }
    --                 },
    --                 ["core.integrations.telescope"] = {},
    --                 ["core.dirman"] = {
    --                     config = {
    --                         workspaces = {
    --                             work = "~/notes/work",
    --                             home = "~/notes/home",
    --                         }
    --                     }
    --                 },
    --                 ["core.integrations.treesitter"] = {},
    --                 ["core.export"] = {
    --                     config = {
    --                         export_dir = "~/notes/export"
    --                     }
    --                 },
    --                 ["core.export.markdown"] = {},
    --                 ["core.esupports.hop"] = {},
    --             }
    --         }
    --     end
    -- },
    -- { 'nvim-neorg/neorg-telescope',    dependencies = { 'nvim-neorg/neorg' } },
    { 'ThePrimeagen/git-worktree.nvim' },
    {
        'sourcegraph/sg.nvim',
        build = 'nvim -l build/init.lua',
        config = function()
            local sg = require("sg");
            sg.setup();
        end
    },
    { 'laytan/cloak.nvim' },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    -- { 'github/copilot.vim' },
    -- {
    --     "Exafunction/codeium.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "hrsh7th/nvim-cmp",
    --     },
    --     config = function()
    --     end
    -- },
    {
        'RaafatTurki/hex.nvim',
        config = function()
            require('hex').setup({
            })
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            local comment = require("Comment");
            comment.setup();
        end
    },
    { 'windwp/nvim-autopairs',      config = function() require("nvim-autopairs").setup {} end },
    {
        'dzfrias/arena.nvim',
        config = function()
            require("arena").setup()
        end
    },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("trouble").setup {}
        end
    },
    { 'mhartington/formatter.nvim' },
    {
        dir = "/home/s/repo/neovim/test_plugin",
        -- dev = true,
        config = function()
            require("test_plugin").setup()
        end,
    },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {
    --     }
    -- },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        ----- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<C-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    -- {
    --     "elixir-tools/elixir-tools.nvim",
    --     version = "*",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         local elixir = require("elixir")
    --         local elixirls = require("elixir.elixirls")
    --
    --         elixir.setup {
    --             nextls = { enable = true },
    --             credo = {},
    --             elixirls = {
    --                 enable = true,
    --                 settings = elixirls.settings {
    --                     dialyzerEnabled = false,
    --                     enableTestLenses = false,
    --                 },
    --                 on_attach = function(client, bufnr)
    --                     vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
    --                     vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
    --                     vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    --                 end,
    --             }
    --         }
    --     end,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    }
}

require('lazy').setup(plugins)
