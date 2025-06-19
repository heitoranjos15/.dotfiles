---  TABS
vim.keymap.set("n", '<leader>tn', ':tabnew <CR>')
vim.keymap.set("n", '<leader>ta', ':tabfirst <CR>')
vim.keymap.set("n", '<leader>to', ':tabp <CR>')
vim.keymap.set("n", '<leader>te', ':tabn <CR>')
vim.keymap.set("n", '<leader>tu', ':tablast <CR>')
vim.keymap.set("n", '<leader>tc', ':tabclose <CR>')


--- WINDOWS
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

vim.keymap.set('n', '<A-l>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>',    ':resize -2<CR>',          { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>',  ':resize +2<CR>',          { noremap = true, silent = true })

vim.keymap.set('n', '<A-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Up>',    ':resize -2<CR>',          { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>',  ':resize +2<CR>',          { noremap = true, silent = true })


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n",'<leader>u', ':UndotreeShow<CR>')


vim.keymap.set("n",'<leader>e', ':luafile %<CR>')
