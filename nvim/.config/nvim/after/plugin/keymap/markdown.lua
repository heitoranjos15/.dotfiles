local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap

nnoremap('mo', '<Plug>MarkdownPreview')
nnoremap('ms', '<Plug>MarkdownPreviewStop')
nnoremap('mp', '<Plug>MarkdownPreviewToggle')
