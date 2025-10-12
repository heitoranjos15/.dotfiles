require("toggleterm").setup()

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- vim.keymap.set('t', '<C-c>', [[<C-\><C-n>:q<CR>]], opts)
end

vim.keymap.set('n', '<leader>tt', ':tabnew | terminal<CR>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>ts', ':split | terminal <CR>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {silent = true, noremap = true})

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
