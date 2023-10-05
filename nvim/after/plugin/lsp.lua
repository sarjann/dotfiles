local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'rust_analyzer',
		'pyright',
        'golangci_lint_ls',
        'ocamllsp',
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

