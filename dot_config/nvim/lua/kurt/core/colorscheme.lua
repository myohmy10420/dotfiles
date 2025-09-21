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

-- Enable 24-bit (true-color) mode
-- Modern Neovim and recent tmux versions support true colors
if (vim.fn.has("termguicolors")) then
  vim.opt.termguicolors = true
end
