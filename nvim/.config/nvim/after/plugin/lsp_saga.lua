-- local saga = require('lspsaga')
-- local Remap = require('helper.keymap')
-- local nnoremap = Remap.nnoremap
--
-- saga.setup {
--   server_filetype_map = {
--     typescript = 'typescript'
--   }
-- }
--
-- nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>')
-- nnoremap('<leader>gd', '<Cmd>Lspsaga lsp_finder<CR>')
-- nnoremap('<leader>vd', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
-- nnoremap(']d', function()
--   require('lspsaga.diagnostic').goto_prev()
-- end)
-- nnoremap('[d', function()
--   require('lspsaga.diagnostic').goto_next()
-- end)
-- nnoremap('<leader>ca', '<cmd>Lspsaga code_action<CR>')
-- -- nnoremap('<leader>ca', '<cmd>Lspsaga range_code_action<CR>')
-- nnoremap('<leader>rn', '<cmd>Lspsaga rename<CR>')
