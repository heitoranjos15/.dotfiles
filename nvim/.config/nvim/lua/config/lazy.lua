-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Colorscheme
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_transparent_background = 2
			vim.opt.termguicolors = true
			vim.cmd("colorscheme everforest")
			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		end,
	},

	-- LSP
	-- note: null
	{ "nvimtools/none-ls.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright", -- python
					"ts_ls", -- typescript
					"gopls", -- go
					"eslint", -- javascript/typescript linting
					"yamlls", -- yamlls
					"lua_ls", -- lua
					"dockerls", -- docker
					"docker_compose_language_service", -- docker compose
				},
				automatic_installation = true,
			})
			require("config.plugins.lsp")
		end,
	},
	"nvimtools/none-ls.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		config = function()
			require("config.plugins.telescope")
		end,
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.plugins.lualine")
		end,
	},
	"kyazdani42/nvim-web-devicons",

	-- Git
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", ":G<CR>")
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
			vim.keymap.set("n", "<leader>ch", ":diffget //3<CR>")
			vim.keymap.set("n", "<leader>cu", ":diffget //2<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.plugins.gitsigns")
		end,
	},
	-- AI
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("config.plugins.copilot")
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		config = function()
			require("CopilotChat").setup({})
		end,
	},

	-- DB
	{
		"tpope/vim-dadbod",
		config = function()
			require("config.plugins.dadbod")
		end,
	},
	"kristijanhusak/vim-dadbod-ui",
	"kristijanhusak/vim-dadbod-completion",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.plugins.treesitter")
		end,
	},

	-- Completion
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			require("config.plugins.cmp")
		end,
	},

	"zbirenbaum/copilot-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim",
	"L3MON4D3/LuaSnip",

	-- UI
	--   "MunifTanjim/nui.nvim",
	--   {
	--    "folke/noice.nvim",
	--    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	--    opts = {
	-- presets = { lsp_doc_border = true },
	-- cmdline = {
	--     enabled = false,  -- use default vim cmdline
	-- },
	-- messages = {
	--     enabled = false,  -- use default messages
	-- },
	--    },
	--   },

	-- Trouble
	{
		"folke/trouble.nvim",
		tag = "v3.0.0",
		config = function()
			require("trouble").setup()
		end,
	},

	-- Editing utilities
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	"tpope/vim-surround",
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("config.plugins.harpoon")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				toggler = {
					line = "gcc",
					block = "gbc",
				},
			})
			require("Comment.ft").set("sql", { "--%s", "/*%s*/" })
			require("Comment.ft").set("mysql", { "--%s", "/*%s*/" })
		end,
	},

	-- Navic
	"SmiteshP/nvim-navic",

	-- Your own plugin
	"heitoranjos15/booky.nvim",

	-- Oil
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				column = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
					["<C-p>"] = false,
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "<leader>n", "<CMD>Oil<CR>")
			vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { noremap = true, silent = true })
		end,
	},

	-- Toggleterm
	{
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},

	-- Tabs
	{
		"nanozuki/tabby.nvim",
		config = function()
			require("config.plugins.tabby")
		end,
	},

	-- FZF
	"junegunn/fzf.vim",

	-- Present
	"tjdevries/present.nvim",

  {
	"stevearc/conform.nvim",
	config = function()
		require("config.plugins.conform")
	end,
  },
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		config = function()
			require("mason-conform").setup({
				ensure_installed = { "black", "isort" },
			})
		end,
	},
})
