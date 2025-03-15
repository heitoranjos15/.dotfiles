local lsp = require('lspconfig')
local config = require('helper.lsp_config')

lsp.elixirls.setup(config({
    cmd = {'/home/sword/language-servers/elixir-ls/language_server.sh'}
}))
