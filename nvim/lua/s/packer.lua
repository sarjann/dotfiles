-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use ('wbthomason/packer.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "kelly-lin/ranger.nvim",
        config = function()
            require("ranger-nvim").setup({ replace_netrw = false })
            vim.api.nvim_set_keymap("n", "<leader>ef", "", {
                noremap = true,
                callback = function()
                    require("ranger-nvim").open(true)
                end,
            })
        end,
    }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use {
        'windwp/nvim-ts-autotag',
        config = function()
            local autotag = require("nvim-ts-autotag")
            autotag.setup()
        end
    }
    use("epwalsh/obsidian.nvim")
    use("folke/zen-mode.nvim")
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},

            -- Dap
            {"mfussenegger/nvim-dap"},
            {"jay-babu/mason-nvim-dap.nvim"},
            {"leoluz/nvim-dap-go"},
            {"simrat39/rust-tools.nvim"},
            {"mfussenegger/nvim-dap-python"},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    use({
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
        },
        config = function ()
            local dapui = require("dapui")
            dapui.setup()
            dapui.close()
        end
    })
    use {
        'Weissle/persistent-breakpoints.nvim',
        config = function()
            local pers_break = require("persistent-breakpoints")
            pers_break.setup {
                load_breakpoints_event = {"BufReadPost"}
            }
        end
    }
    use('nvim-lua/popup.nvim');
    use('nvim-telescope/telescope-fzy-native.nvim');
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            local lualine = require('lualine')
            lualine.setup {
                options = {
                    theme = 'rose-pine'
                }
            }
        end
    };
    use {
        "nvim-neorg/neorg",
        requires = {
            "nvim-telescope/telescope.nvim",
        },
        run = ":Neorg sync-parsers", -- This is the important bit!
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        }
                    },
                    ["core.integrations.telescope"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/notes/work",
                                home = "~/notes/home",
                            }
                        }
                    },
                    ["core.integrations.treesitter"] = {},
                    ["core.export"] = {
                        config = {
                            export_dir = "~/notes/export"
                        }
                    },
                    ["core.export.markdown"] = {},
                    ["core.esupports.hop"] = {},
                }
            }
        end,
    }
    use {
        'nvim-neorg/neorg-telescope',
        requires = {
            "nvim-neorg/neorg",
        }
    };
    use('ThePrimeagen/git-worktree.nvim');
    use { 'sourcegraph/sg.nvim',
    run = 'nvim -l build/init.lua',
    config = function()
        local sg = require("sg");
        sg.setup();
    end,
    };

    use('github/copilot.vim');
    use {
        'RaafatTurki/hex.nvim',
        config = function()
            require('hex').setup({
            })
        end
    };
    use({
        "numToStr/Comment.nvim",
        config = function()
            local comment = require("Comment")
            comment.setup()
        end
    })
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "Dhanus3133/LeetBuddy.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require('leetbuddy').setup({
                domain = "com",
                language = "py",
            })
        end
    }
    use {
        "dzfrias/arena.nvim",
        config = function()
            require("arena").setup()
        end
    }
    end)
