require("nvim-treesitter").setup({
    ensure_installed = {
        "python", "typescript", "javascript", "go",
        "lua", "bash", "json", "markdown",
    },
    highlight = { enable = true },
    indent = { enable = true },
})
