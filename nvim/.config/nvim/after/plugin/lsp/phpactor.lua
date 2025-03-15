local lsp = require('lspconfig')
local config = require('helper.lsp_config')

lsp.intelephense.setup(config())
