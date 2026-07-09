require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local map = function(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
		end

		-- navigation
		map("n", "]h", gs.next_hunk, "Next hunk")
		map("n", "[h", gs.prev_hunk, "Prev hunk")

		-- staging
		map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
		map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
		map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")

		-- diff
		map("n", "<leader>gd", gs.diffthis, "Diff this")
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end, "Diff this ~")

		-- blame
		map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle blame")
	end,
})
