-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  -- spec = {
  --   -- import your plugins
  --   { import = "plugins" },
  -- },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  -- 顏色主題
  { "morhetz/gruvbox" },

  -- Tmux + Vim 整合
  { "christoomey/vim-tmux-navigator" },

  -- 視窗放大
  { "szw/vim-maximizer" },

  -- text objects
  { "tpope/vim-surround" },

  -- comment toggle
  { "numToStr/Comment.nvim", config = true },

  -- file explorer
  { "nvim-tree/nvim-tree.lua" },

  -- status line
  { "nvim-lualine/lualine.nvim" },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- git
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },

  -- multi cursor
  { "mg979/vim-visual-multi" },

  -- ruby on rails
  { "tpope/vim-rails" },

  -- neotest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",
      "olimorris/neotest-rspec",
    }
  },

  -- window resizer
  { "simeji/winresizer" },

  -- auto completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- lsp config only (mason 已移除)
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "onsails/lspkind.nvim" },

  -- DB
  {
    "tpope/vim-dadbod",
    dependencies = { "kristijanhusak/vim-dadbod-ui" }
  },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter" },

  -- Avante
  {
    "yetone/avante.nvim",
    branch = "main",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "MunifTanjim/nui.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    }
  },

  -- Copilot (用新的 Lua 版本)
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end
  }
})

