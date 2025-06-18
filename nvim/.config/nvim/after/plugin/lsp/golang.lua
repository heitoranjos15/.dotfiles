local lsp = require('lspconfig')
-- local util = require("lspconfig.util")
local config = require('helper.lsp_config')

lsp.gopls.setup(config({
  root_dir = require('lspconfig.util').root_pattern("go.work", "go.mod", ".git"),
  flags = {
    debounce_text_changes = 300,
  },
  settings = {
    gopls = {
      staticcheck = false,
      expandWorkspaceToModule = false,
      directoryFilters = {
        "-vendor", "-node_modules", "-.git", "-third_party", "-gen", "-testdata",
      },
      codelenses = {
        generate = false,
        gc_details = false,
        tidy = false,
        upgrade_dependency = false,
        vendor = false,
      },
    },
  }
}))
