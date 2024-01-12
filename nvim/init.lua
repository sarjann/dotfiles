require("s")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.o.runtimepath = vim.o.runtimepath .. ',' .. lazypath


local plugins = {
  {'nvim-telescope/telescope.nvim', version = '0.1.3', dependencies = { {'nvim-lua/plenary.nvim'} }},
  {
      "kelly-lin/ranger.nvim",
      config = function()
          require("ranger-nvim").setup({ replace_netrw = false})
          vim.api.nvim_set_keymap("n", "<leader>ef", "", {
              noremap = true,
              silent = true,
              callback = function()
                  require("ranger-nvim").open(true)
              end,
          })
      end,
  },
  {'rose-pine/neovim', name = 'rose-pine', config = function()
      vim.cmd('colorscheme rose-pine')
  end},
  {'nvim-treesitter/nvim-treesitter'},
  {'nvim-treesitter/playground'},
  {'windwp/nvim-ts-autotag', config = function()
      local autotag = require("nvim-ts-autotag")
      autotag.setup()
  end},
  {'epwalsh/obsidian.nvim'},
  {'folke/zen-mode.nvim'},
  {'ThePrimeagen/harpoon', branch = "harpoon2", dependencies = { {"nvim-lua/plenary.nvim"} }},
  {'mbbill/undotree'},
  {'tpope/vim-fugitive'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', dependencies = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},
      {'mfussenegger/nvim-dap'},
      {'jay-babu/mason-nvim-dap.nvim'},
      {'leoluz/nvim-dap-go'},
      {'simrat39/rust-tools.nvim'},
      {'mfussenegger/nvim-dap-python'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
  }},
  {'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap'}, config = function()
      local dapui = require("dapui")
      dapui.setup()
      dapui.close()
  end},
  {'Weissle/persistent-breakpoints.nvim', config = function()
      local pers_break = require("persistent-breakpoints")
      pers_break.setup {
          load_breakpoints_event = {"BufReadPost"}
      }
  end},
  {'nvim-lua/popup.nvim'},
  {'nvim-telescope/telescope-fzy-native.nvim'},
  {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons', lazy = true}, config = function()
      local lualine = require('lualine')
      lualine.setup {
          options = {
              theme = 'rose-pine'
          }
      }
  end},
  {'nvim-neorg/neorg', dependencies = {'nvim-telescope/telescope.nvim'}, build = ":Neorg sync-parsers", config = function()
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
  end},
  {'nvim-neorg/neorg-telescope', dependencies = {'nvim-neorg/neorg'}},
  {'ThePrimeagen/git-worktree.nvim'},
  {'sourcegraph/sg.nvim', build = 'nvim -l build/init.lua', config = function()
      local sg = require("sg");
      sg.setup();
  end},
  {'github/copilot.vim'},
  {'RaafatTurki/hex.nvim', config = function()
      require('hex').setup({
      })
  end},
   {'numToStr/Comment.nvim', config = function()
       local comment = require("Comment");
        comment.setup();
   end},
  {'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end},
  {'dzfrias/arena.nvim', config = function()
      require("arena").setup()
  end},
  {'nvim-tree/nvim-web-devicons'},
  {'folke/trouble.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}, config = function()
      require("trouble").setup {}
  end},
  {'mhartington/formatter.nvim'},
}

require('lazy').setup(plugins)

