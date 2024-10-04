local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just install

-- Autocommand that reloads nvim whenever save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- lua functions that many plugins to use
  -- telescope require, 載入後 telescope 可以預覽檔案
  use("nvim-lua/plenary.nvim")

  use("morhetz/gruvbox") --perferred colorscheme
  use("christoomey/vim-tmux-navigator") -- 搭配 .tmux.conf 支援 vim switch to other tmux window
  use("szw/vim-maximizer") -- vim-maximizer & restores current window
  use("tpope/vim-surround") -- c = change, d = delete, y = add, 後面 + s(surround) 開始使用
  use("numToStr/Comment.nvim") -- gc = comment
  use("nvim-tree/nvim-tree.lua") -- file explorer
  use("nvim-lualine/lualine.nvim") -- nvim 也有 statusline
  use("nvim-telescope/telescope.nvim") -- fuzzy finding
  use {"akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons"}
  use("lewis6991/gitsigns.nvim") -- git plugin
  use("tpope/vim-fugitive") -- git plugin
  use("mg979/vim-visual-multi") -- ctrl n 跟 vscode crtl d 一樣效果
  -- use("vim-ruby/vim-ruby") -- 基本的 ruby 檔案一些指令, 但都沒有效果, 需研究
  use("tpope/vim-rails") -- 有:A, gf 等指令可以用
  use("kassio/neoterm") -- quick open new terminal, 目前只用來搭配 vim-rspec
  use("thoughtbot/vim-rspec") -- rspec plugin
  use("simeji/winresizer") -- window quick resize

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use("hrsh7th/cmp-buffer") -- source for buffer words
  use("hrsh7th/cmp-path") -- source for filesystem paths
  use("hrsh7th/cmp-cmdline") -- source for command line

  -- autocompletion - snippets
  use("L3MON4D3/LuaSnip") -- Snippets plugin
  use("saadparwaiz1/cmp_luasnip")  -- Snippets source for nvim-cmp
  use("rafamadriz/friendly-snippets")

  -- managing & installing lsp server
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
  use("hrsh7th/cmp-nvim-lsp")  -- LSP source for nvim-cmp
  use({"glepnir/lspsaga.nvim", branch = "main" })
  use("onsails/lspkind.nvim")

  -- solargraph 官網說要安裝 languageclient-neovim
  -- use({"autozimu/languageclient-neovim", branch = "next", run = "bash install.sh"})
  -- cd ~/.local/share/nvim/site/pack/packer/start/languageclient-neovim 自己跑 bash install.sh ，不然會 timeout
  use({"autozimu/languageclient-neovim", branch = "next"})

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
