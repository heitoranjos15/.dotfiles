require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
    },
    formatters = {
        black = {
            command = vim.fn.stdpath("data") .. "/mason/bin/black",
        },
        isort = {
            command = vim.fn.stdpath("data") .. "/mason/bin/isort",
        },
    },
    format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
