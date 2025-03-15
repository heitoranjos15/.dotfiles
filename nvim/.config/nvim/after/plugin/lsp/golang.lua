local lsp = require('lspconfig')
local config = require('helper.lsp_config')

lsp.gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
      env = {
        GOFLAGS = "-tags=test"
      },
		},
	},
}))
