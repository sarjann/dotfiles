local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'lua_ls',
        'eslint',
        'elixirls',
        'rust_analyzer',
        'pyright',
        'gopls',
        'ocamllsp',
        'gopls',
        'clangd',
        'html',
        'jsonls',
        'bashls',
        'cmake',
        'dockerls',
        'htmx',
        'taplo',
        'hydra_lsp',
        'templ',

    },
    handlers = {
        lsp_zero.default_setup,
    },
})


require('lspconfig').clangd.setup{
    cmd = { "clangd", "--fallback-style=none" }
}
