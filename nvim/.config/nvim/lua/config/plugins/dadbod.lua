vim.g.dbs = {
    xr_local = 'postgres://postgres:postgres@localhost:5432',
    xr_solutions = 'postgres://postgres:13579XRsolution@database-xr.cv8w2wa6sxs2.eu-north-1.rds.amazonaws.com:5432/xr_solutions_db',
}

vim.cmd('autocmd FileType dbout setlocal nofoldenable')

vim.keymap.set("n",'<leader>db', ':DBUI<CR>')
