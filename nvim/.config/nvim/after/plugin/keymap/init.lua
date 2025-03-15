local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

nnoremap('<C-n>', ':Explore<CR>')

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap('<leader>u', ':UndotreeShow<CR>')

nnoremap('<leader>db', ':DBUI<CR>')

nnoremap('th', ':tabfirst<CR>')
nnoremap('tk', ':tabnext<CR>')
nnoremap('tj', ':tabprevious<CR>')
nnoremap('tl', ':tablast<CR>')
nnoremap('tn', ':tabnext<CR>')
nnoremap('td', ':tabclose<CR>')
nnoremap('t%', ':tabnew<CR>')
