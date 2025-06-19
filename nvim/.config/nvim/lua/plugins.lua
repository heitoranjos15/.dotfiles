local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'sainnhe/everforest' -- Colorscheme

  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'williamboman/mason.nvim'
  use { "williamboman/mason-lspconfig.nvim" }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- LuaLine
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- GIT
  use 'tpope/vim-fugitive'

  -- AI
  use 'github/copilot.vim'

  -- DB
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'
  use 'L3MON4D3/LuaSnip'     -- Useful for docs

  use 'MunifTanjim/nui.nvim' -- UI toolkit

  use {
    'folke/noice.nvim',
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
  }

  use({
    'folke/trouble.nvim',
    tag = "v3.0.0",
    config = function()
      require("trouble").setup()
      -- vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
    end
  })

  use 'mbbill/undotree'
  use 'tpope/vim-surround'
  use 'ThePrimeagen/harpoon'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
      })
      require('Comment.ft').set('sql', { '--%s', '/*%s*/' })
      require('Comment.ft').set('mysql', { '--%s', '/*%s*/' })
    end
  }
  use { 'SmiteshP/nvim-navic' }

  use { 'heitoranjos15/booky.nvim' }

  use { 'nvimdev/indentmini.nvim',
    config = function()
      require("indentmini").setup() -- use default config
    end,
  }

  use { 'stevearc/oil.nvim',
    config = function()
      require("oil").setup {
        column = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<M-h>"] = "actions.select_split",
          ["<C-p>"] = false,
        },
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>")
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { noremap = true, silent = true })
    end,
  }

use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}

  use { 'nanozuki/tabby.nvim' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
