local function copilot_status()
  -- Skip in floating windows (e.g. during nvim-cmp popup)
  if vim.api.nvim_win_get_config(0).relative ~= "" then
    return ""
  end

  -- Get Copilot status safely
  local ok, status = pcall(vim.fn["copilot#Enabled"])
  if not ok then return "" end

  return status == 1 and " Copilot" or ""
end


require('lualine').setup({
  sections = {
    lualine_x = {
      copilot_status,
      'encoding',
      'fileformat',
      'filetype',
    },
  },
  options = {
    theme = 'everforest',
  },
})
