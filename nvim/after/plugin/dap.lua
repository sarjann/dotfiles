-- local builtin = require('dap')

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)

vim.keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

vim.keymap.set('n', '<F9>', function()
    require("dapui").toggle()
end)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Save breakpoints to file automatically.
vim.keymap.set("n", "<Leader>b", function() require('persistent-breakpoints.api').toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>c", function() require('persistent-breakpoints.api').clear_all_breakpoints() end)


require("mason-nvim-dap").setup({
    ensure_installed = { "python", "delve", "codelldb", "cpptools" },
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
    },
})

-- LSP Setup
require('dap-go').setup()
require('dap-python').setup("~/.pyenv/versions/3.10.12/envs/debugpy/bin/python")

local dap = require("dap")


dap.adapters.codelldb = {
    type = 'server',
    port = "1234",
    executable = {
        command = 'lldb-vscode',
        args = { "--port", "1234" },
    }
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.c = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/build/make/Debug', 'file')
            return vim.fn.getcwd() .. '/target/out'
        end,
        --program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}',
        terminal = 'integrated'
    }
}

dap.configurations.cpp = dap.configurations.c
