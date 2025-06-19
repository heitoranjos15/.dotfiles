local lsp = require('lspconfig')
local config = require('lsp_default')

lsp.ts_ls.setup(config({
  filetypes =  { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
}))

lsp.jsonls.setup(config())
