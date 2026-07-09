local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup({
    defaults = {
        prompt_prefix = " > ",
        color_devicons = true,
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
            n = {
                ["q"] = actions.close,
            },
        },
    },
})

-- keymaps
vim.keymap.set("n", "<leader>;", function() builtin.find_files() end)
vim.keymap.set("n", "<leader>vh", function() builtin.help_tags() end)
vim.keymap.set("n", "<leader>pb", function() builtin.buffers() end)
vim.keymap.set("n", "<leader>pf", function() builtin.live_grep() end)

-- custom commands
local commands = {}

commands.search_dotfiles = function()
    builtin.find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.dotfiles/nvim/.config/nvim",
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
        prompt_title = "< AWESOMEWM >",
        cwd = "~/.dotfiles/awesome/.config/awesome",
        hidden = true,
    })
end

vim.keymap.set("n", "<leader>gb", function() commands.git_branches() end)
vim.keymap.set("n", "<leader>dt", function() commands.search_dotfiles() end)
vim.keymap.set("n", "<leader>wm", function() commands.awesome_wm() end)
