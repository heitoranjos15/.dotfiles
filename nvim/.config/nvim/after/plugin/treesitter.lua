require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  ensure_installed = {
      'lua',
      'elixir',
      'json',
      'graphql',
      'bash',
      'markdown',
      'python',
      'regex',
      'sql',
      'typescript',
      'javascript',
      'php',
      'go',
      "markdown",
      "markdown_inline" 
  },
 context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}
