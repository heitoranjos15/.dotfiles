local telescope = require('telescope.builtin')
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

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

vim.keymap.set("n", '<leader>;', function()
    telescope.find_files()
end)

vim.keymap.set("n", '<leader>vh', function()
    telescope.help_tags()
end)

vim.keymap.set("n", '<leader>pb', function ()
  telescope.buffers()
end)

vim.keymap.set("n", '<leader>pf', function ()
  telescope.live_grep()
end)

---- Commands
local commands = {}

commands.search_dotfiles = function()
	builtin.find_files({
		prompt_title = "< VimRC >",
		cwd = '~/.dotfiles/nvim/.config/nvim',
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
        cwd = '~/.dotfiles/awesome/.config/awesome',
        hidden = true,
    })
end

vim.keymap.set("n", '<leader>gb', function()
    commands.git_branches()
end)

vim.keymap.set("n", '<leader>dt', function ()
    commands.search_dotfiles()
end)

vim.keymap.set("n", '<leader>wm', function ()
    commands.awesome_wm()
  end)
