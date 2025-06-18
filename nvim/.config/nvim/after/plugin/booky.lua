local booky = require('booky')

local months = {
  "janeiro", "fevereiro", "março", "abril",
  "maio", "junho", "julho", "agosto",
  "setembro", "outubro", "novembro", "dezembro"
}

local date = os.date("*t")
local todo_path = os.getenv("HOME") .. "/todo/"
local formatted = string.format(
  "%04d/%02d_%s/%02d",
  date.year, date.month, months[date.month], date.day
)

print("Formatted date: " .. todo_path..formatted.."/tasks.md")
booky.setup.todo_file_path = vim.fn.expand(todo_path..formatted.."/tasks.md")

local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap

-- nnoremap('<leader>e', function() booky.open_split() end)
