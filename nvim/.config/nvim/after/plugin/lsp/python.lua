local lsp = require('lspconfig')
local config = require('helper.lsp_config')

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
