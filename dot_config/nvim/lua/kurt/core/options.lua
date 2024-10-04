local opt = vim.opt -- for consieness

-- line number
opt.relativenumber = true
opt.number = true

-- tab & identation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false -- 字數超過 termin 寬度不換行顯示

-- search setting
opt.ignorecase = true -- 不分大小寫
opt.smartcase = true

-- search setting
opt.cursorline = true -- cursor 那一行會反白

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
--   indent 允许删除自动缩进的内容。如果没有这一项，自动缩进添加的空白字符无法用 Backspace 键来删除，可以删除手动添加的缩进空格。
--   eol 允许删除换行符。如果没有这一项，当已经删除到行首时，不能用 Backspace 键删除换行符，也就是不能自动往上删除到上一行。
--   start 允许删除进入插入模式前已有的内容。如果没有这一项，不能删除进入插入模式前已有的内容，只能删除当前插入模式下输入的字符。例如，输入 abc 三个字符，按 Esc 键退出插入模式，再按 a，进入插入模式，输入 efg。此时 Backspace 键可以删除 efg，不能删除 abc。
opt.backspace = "indent,eol,start"

-- clipboard: 所有複製效果現在也會直接到系統的 clipboard
opt.clipboard:append("unnamedplus")

-- slip window
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- A-lin 會當作一個字元, dw 會直接刪除

-- nvim-treesitter folding codes
opt.foldenable = false -- 開檔案是不要自動 folding
-- opt.foldlevel = 99 -- 不知作用
-- 一下兩行開啟 folding 設定
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
