require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true, -- shows suggestion automatically as you type
		keymap = {
			accept = "<C-j>", -- your old accept keybind
			accept_word = "<C-l>", -- accept just one word
			accept_line = false,
			next = "<M-]>", -- cycle to next suggestion
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	panel = { enabled = false },
})
require("CopilotChat").setup({
	model = "claude-haiku-4.5",
})
