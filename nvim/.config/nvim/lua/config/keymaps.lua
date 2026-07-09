local map = vim.keymap.set

-- general
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- LSP (you can move these here from lsp.lua if you prefer them central)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>vd", vim.diagnostic.open_float)

--TABS
vim.keymap.set("n", '<leader>tn', ':tabnew <CR>')
vim.keymap.set("n", '<leader>ta', ':tabfirst <CR>')
vim.keymap.set("n", '<leader>to', ':tabp <CR>')
vim.keymap.set("n", '<leader>te', ':tabn <CR>')
vim.keymap.set("n", '<leader>tu', ':tablast <CR>')
vim.keymap.set("n", '<leader>tc', ':tabclose <CR>')

vim.keymap.set('n', '<leader>tt', ':tabnew | terminal<CR>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>ts', ':split | terminal <CR>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {silent = true, noremap = true})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')



--- WINDOWS
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- set window bottom
vim.keymap.set('n', '<A-j>', '<C-w>J', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>K', { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', '<C-w>H', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>L', { noremap = true, silent = true })

vim.keymap.set('n', '<A-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Up>',    ':resize -2<CR>',          { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>',  ':resize +2<CR>',          { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n",'<leader>e', ':luafile %<CR>')

vim.keymap.set("n", '<leader>ai', ':CopilotChat<CR>')
