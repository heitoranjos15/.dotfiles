vim.o.laststatus = 3

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "NONE", bg = "NONE" })
    end)
  end,
})
