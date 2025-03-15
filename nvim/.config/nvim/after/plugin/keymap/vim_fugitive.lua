local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap

nnoremap('<leader>gs', ':G<CR>')
nnoremap('<leader>gc', ':Git commit<CR>')
nnoremap('<leader>ch', ':diffget //3<CR>')
nnoremap('<leader>cu', ':diffget //2<CR>')
