vim.api.nvim_create_user_command("GameView", function(opts)
  vim.o.splitbelow = false
  vim.o.splitright = true

  vim.cmd("tabnew | terminal")
  vim.cmd("vsplit | terminal")

  vim.cmd("split | terminal")

  vim.cmd("wincmd J")
end, {})
