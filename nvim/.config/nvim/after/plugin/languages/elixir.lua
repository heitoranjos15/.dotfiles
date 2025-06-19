local lsp = require('lspconfig')
local config = require('lsp_default')

lsp.elixirls.setup(config({
    cmd = {'/home/sword/language-servers/elixir-ls/language_server.sh'}
}))

