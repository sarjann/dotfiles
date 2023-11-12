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
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
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
            pers_break.setup{
                load_breakpoints_event = {"BufReadPost"}
            }
        end
    }
    use('nvim-lua/popup.nvim');
    use('nvim-telescope/telescope-fzy-native.nvim');
    use('hoob3rt/lualine.nvim');
    use('ThePrimeagen/git-worktree.nvim');
    use('github/copilot.vim');
    -- use({
        --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        --     config = function()
            --         require("lsp_lines").setup()
            --     end,
            -- })
            use({
                "numToStr/Comment.nvim",
                config = function()
                    require("Comment").setup()
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
                        language = "rs",
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
