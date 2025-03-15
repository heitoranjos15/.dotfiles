local Remap = require('helper.keymap')
local nnoremap = Remap.nnoremap
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

---- Commands
local commands = {}

commands.search_dotfiles = function()
	builtin.find_files({
		prompt_title = "< VimRC >",
		cwd = '~/dotfiles/nvim/.config/nvim',
		hidden = true,
	})
end

commands.git_branches = function()
	builtin.git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

commands.awesome_wm = function()
    builtin.find_files({
        prompt_title = '< AWESOMEWM >',
        cwd = '~/dotfiles/awesome/.config/awesome',
        hidden = true,
    })
end

nnoremap('<leader>gb', function()
    commands.git_branches()
end)

nnoremap('<leader>dt', function ()
    commands.search_dotfiles()
end)

nnoremap('<leader>wm', function ()
    commands.awesome_wm()
end)
