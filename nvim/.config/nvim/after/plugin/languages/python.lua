local lsp = require('lspconfig')
local config = require('lsp_default')

lsp.pylsp.setup(config({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}))
