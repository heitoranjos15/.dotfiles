local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
local popup = require "plenary.popup"

local function create_border_popup(borderchars)
  local _, config = popup.create("popup with custom border", {
    line = 8,
    col = 55,
    padding = { 0, 3, 0, 3 },
    borderchars = borderchars,
  })
  local border_id = config.border.win_id
  local border_bufnr = vim.api.nvim_win_get_buf(border_id)
  print(border_id)
  print(border_bufnr)
end

nnoremap('<leader>td', function() create_border_popup() end)
