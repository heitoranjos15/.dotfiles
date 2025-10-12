local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local telescope_commands = {}

telescope_commands.search_dotfiles = function()
	builtin.find_files({
		prompt_title = "< VimRC >",
		cwd = '~/dotfiles/nvim/.config/nvim',
		hidden = true,
	})
end

telescope_commands.git_branches = function()
	builtin.git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

telescope_commands.awesome_wm = function()
    builtin.find_files({
        prompt_title = '< AWESOMEWM >',
        cwd = '~/dotfiles/awesome/.config/awesome',
        hidden = true,
    })
end

return telescope_commands
