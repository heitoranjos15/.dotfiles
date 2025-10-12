local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap('<leader>tc', ':tabnew <CR>')
nnoremap('<leader>th', ':tabn <CR>')
nnoremap('<leader>tu', ':tabp <CR>')
nnoremap('<leader>ta', ':tabfirst <CR>')
nnoremap('<leader>ts', ':tablast <CR>')
