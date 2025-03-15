vim.g.dbs = {
    cloud = 'mysql://heitor.anjos:Ky34pg7TSBROZtragi04@127.0.0.1:3361',
    localhost = 'mysql://root:root@127.0.0.1:3306',
}

vim.cmd('autocmd FileType dbout setlocal nofoldenable')
