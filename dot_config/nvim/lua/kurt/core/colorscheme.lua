vim.g.gruvbox_italic = 1

local status, _ = pcall(vim.cmd, "colorscheme gruvbox")

if not status then
  print("Colorscheme not found!")
  return
end

-- 設置 Diff 的顏色
-- example: vim.api.nvim_set_hl(namespace_id, highlight_group, highlight_options)
-- namespace_id：通常設為 0（代表全域）。
-- highlight_group：高亮群組名稱，例如 "DiffAdd"。
-- highlight_options：包含 fg（前景色）、bg（背景色）、bold、italic 等選項。
-- 選項說明：
--
-- fg：前景色，使用 HEX 顏色碼或字串 "NONE"。
-- bg：背景色，使用 HEX 顏色碼或字串 "NONE"。
-- bold、italic、underline：設定是否加粗、斜體或下劃線，例如 { bold = true }。
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#b8bb26", bg = "#3c3836" })    -- 新增
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#fb4934", bg = "#3c3836" }) -- 刪除
vim.api.nvim_set_hl(0, "DiffChange", { fg = "#fabd2f", bg = "#3c3836" }) -- 修改
vim.api.nvim_set_hl(0, "DiffText", { fg = "#83a598", bg = "#504945" })   -- 文本上下文
-- 一下是 gitlab 的配色不搭 gruvbox
-- vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = "#d4f4dd" })    -- 新增 (綠色)
-- vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", bg = "#fbdcdc" }) -- 刪除 (紅色)
-- vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", bg = "#fff5dc" }) -- 修改 (黃色)
-- vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", bg = "#add8ff" })   -- 文本上下文 (藍色)

-- Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
-- If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
-- (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (vim.fn.empty(vim.env.TMUX)) then
  -- 如何拿 vim 環境變數($) 可參考 https://vi.stackexchange.com/questions/31737/get-value-of-myvimrc-from-lua
  if (vim.fn.has("nvim")) then
    -- For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  end
  -- For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  -- Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  -- < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (vim.fn.has("termguicolors")) then
    vim.opt.termguicolors = true
  end
  return
end
