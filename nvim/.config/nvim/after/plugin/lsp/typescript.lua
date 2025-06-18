local lsp = require('lspconfig')
local config = require('helper.lsp_config')

lsp.ts_ls.setup(config({
  filetypes =  { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
}))

lsp.jsonls.setup(config())
