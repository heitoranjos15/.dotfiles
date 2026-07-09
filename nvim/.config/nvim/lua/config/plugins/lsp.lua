-- lua/config/plugins/lsp.lua
local map = vim.keymap.set

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	map("n", "<leader>vd", vim.diagnostic.open_float, opts)
	map("n", "[d", vim.diagnostic.goto_prev, opts)
	map("n", "]d", vim.diagnostic.goto_next, opts)
	map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	map("n", "<leader>vrr", vim.lsp.buf.references, opts)
end

-- Python
vim.lsp.config("pyright", {
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "basic",
			},
			pythonPath = vim.fn.system("poetry env info -p"):gsub("\n", "") .. "/bin/python",
		},
	},
})
-- TypeScript
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})
-- ESLint
vim.lsp.config("eslint", {
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.code_action({
					context = { only = { "source.fixAll.eslint" } },
					apply = true,
				})
			end,
		})
	end,
	settings = {
		useFlatConfig = false,
		workingDirectory = { mode = "auto" },
	},
})

-- Go
vim.lsp.config("gopls", {
	on_attach = on_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.config("yamlls", {
	on_attach = on_attach,
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
			},
			validate = true,
			hover = true,
			completion = true,
			format = { enable = true },
		},
	},
})

vim.lsp.config("jsonls", {
	on_attach = on_attach,
	settings = {
		json = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.json",
			},
			validate = true,
			hover = true,
			completion = true,
			format = { enable = true },
		},
	},
})

vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

-- Docker
vim.lsp.config("dockerls", {
	on_attach = on_attach,
})

vim.lsp.config("docker_compose_language_service", {
	on_attach = on_attach,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- enable all configured servers
vim.lsp.enable({
	"pyright",
	"ts_ls",
	"gopls",
	"eslint",
	"yamlls",
	"dockerls",
	"docker_compose_language_service",
	"jsonls",
	"lua_ls",
})

-- borders on hover/signature
vim.diagnostic.config({
	float = { border = "rounded" },
})
