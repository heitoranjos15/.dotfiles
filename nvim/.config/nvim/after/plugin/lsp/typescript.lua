local lsp = require('lspconfig')
local config = require('helper.lsp_config')

lsp.tsserver.setup(config({
  filetypes =  { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
}))

lsp.jsonls.setup(config())
