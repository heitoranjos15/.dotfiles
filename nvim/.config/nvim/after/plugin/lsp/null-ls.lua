local null_ls = require('null-ls')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.flake8,
    -- null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.php,
    -- null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofmt,
  },
  -- on_attach = function(client, bufnr)
    -- if client.server_capabilities.documentFormattingProvider then
      -- vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup_format,
      --   buffer = 0,
      --   callback = function() vim.lsp.buf.format() end
      -- })
    -- end
  -- end,
}

vim.api.nvim_create_user_command("AutoFormat", function() vim.lsp.buf.format() end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
