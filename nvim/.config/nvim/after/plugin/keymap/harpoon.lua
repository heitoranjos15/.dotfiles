local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')

nnoremap('<leader>a', function () harpoon_mark.add_file() end)
nnoremap('//', function () harpoon_ui.toggle_quick_menu() end)
nnoremap('<leader>hu', function() harpoon_ui.nav_file(1) end)
nnoremap('<leader>he', function() harpoon_ui.nav_file(2) end)
nnoremap('<leader>ho', function() harpoon_ui.nav_file(3) end)
nnoremap('<leader>ha', function() harpoon_ui.nav_file(4) end)
nnoremap('<leader>h;', function() harpoon_ui.nav_file(5) end)
nnoremap('<leader>h,', function() harpoon_ui.nav_file(6) end)
