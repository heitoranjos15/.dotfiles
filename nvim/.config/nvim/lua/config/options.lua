vim.opt.termguicolors = true
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.opt.signcolumn = "yes"

vim.opt.relativenumber = true
vim.opt.nu = true

vim.scriptenconding = "utf-8"

vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.updatetime = 1000
vim.opt.scrolloff = 8
-- vim.opt.colorcolumn = "120"

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.g.mapleader = " "

vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir = "rm -r"

vim.cmd("autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- use undofile instead, much better
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
