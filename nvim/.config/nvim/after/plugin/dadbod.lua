vim.g.dbs = {
    cloud = 'mysql://heitor.anjos:Ky34pg7TSBROZtragi04@127.0.0.1:3361',
    localhost = 'mysql://root:root@127.0.0.1:3306',
    betty_memory = 'sqlite3:////home/sword/projects/betty/betty_memory/db.sqlite3',
}

vim.cmd('autocmd FileType dbout setlocal nofoldenable')

vim.keymap.set("n",'<leader>db', ':DBUI<CR>')
