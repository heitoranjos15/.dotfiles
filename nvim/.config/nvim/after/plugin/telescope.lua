local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local actions = require("telescope.actions")


require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
            n = {
                ["q"] = actions.close
            },
		},
	},
})

local telescope_commands = {}

telescope_commands.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = '~/dotfiles/nvim/.config/nvim',
		hidden = true,
	})
end

telescope_commands.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

telescope_commands.awesome_wm = function()
    require('telescope.builtin').find_files({
        prompt_title = '< AWESOMEWM >',
        cwd = '~/dotfiles/awesome/.config/awesome',
        hidden = true,
    })
end
