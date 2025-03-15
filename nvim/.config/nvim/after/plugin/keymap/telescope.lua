local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
local telescope_commands = require('setup.telescope')
local telescope = require('telescope.builtin')

nnoremap('<C-p>', function()
    telescope.find_files()
end)

nnoremap('<leader>vh', function()
    telescope.help_tags()
end)

nnoremap('<leader>pb', function ()
  telescope.buffers()
end)

nnoremap('<leader>pf', function ()
  telescope.live_grep()
end)

nnoremap('<leader>gb', function()
    telescope_commands.git_branches()
end)

nnoremap('<leader>dt', function ()
    telescope_commands.search_dotfiles()
end)

nnoremap('<leader>wm', function ()
    telescope_commands.awesome_wm()
end)
