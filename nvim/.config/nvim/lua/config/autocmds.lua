vim.api.nvim_create_user_command("GameView", function(opts)
  vim.o.splitbelow = false
  vim.o.splitright = true

  vim.cmd("tabnew | terminal")
  vim.cmd("vsplit | terminal")

  vim.cmd("split | terminal")

  vim.cmd("wincmd J")
end, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "copilot-chat", "copilot.*" },
  callback = function()
    vim.treesitter.stop()
  end,
})

vim.api.nvim_create_user_command("AutoFormat", function() vim.lsp.buf.format() end, {})

