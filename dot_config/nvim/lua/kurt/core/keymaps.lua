vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness
local builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")


-- unbind
keymap.set("n", "K", "<nop>")
keymap.set("v", "K", "<nop>")
keymap.set("n", "<C-f>", "<nop>")
keymap.set("v", "<C-f>", "<nop>")

-- general
keymap.set("i", "<leader>,", "<Esc>", {desc = ",, can quick quit from i mode"})

keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")

keymap.set("c", "<C-h>", "<Left>")
keymap.set("c", "<C-j>", "<Down>")
keymap.set("c", "<C-k>", "<Up>")
keymap.set("c", "<C-l>", "<Right>")

keymap.set("n", "<leader>e", ":e<space>")
keymap.set("n", "<leader>c", ":")
keymap.set("n", "<leader>dj", "<cmd>bd<CR>")
keymap.set("n", "<leader>dd", "<cmd>bd!<CR>")
keymap.set("n", "<leader>ww", "<cmd>w<CR>")
keymap.set("n", "<leader>q", "<cmd>q<CR>")

keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", {desc = "switch from terminal"})
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", {desc = "switch from terminal"})
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", {desc = "switch from terminal"})
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", {desc = "switch from terminal"})

-- git
keymap.set("n", "<leader>gs", builtin.git_status)
keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")
-- keymap.set("v", "<leader>ga", "<cmd>Gitsigns stage_hunk<CR>")
-- keymap.set("n", "<leader>ga", "V<cmd>Gitsigns stage_hunk<CR>")

-- keymap.set("n", "<leader>ga", function()
--   local lnum = vim.fn.line(".")
--
--   gitsigns.stage_hunk({ lnum, lnum })
-- end, { desc = "Stage current line" })
--
-- keymap.set("v", "<leader>ga", function()
--   local start_line = vim.fn.line("v")
--   local end_line = vim.fn.line(".")
--   if start_line > end_line then
--     start_line, end_line = end_line, start_line
--   end
--   gitsigns.stage_hunk({ start_line, end_line })
-- end, { desc = "Stage selected lines" })


-- 單行 stage
keymap.set("n", "<leader>ga", function()
  local lnum = vim.fn.line(".")

  gitsigns.stage_hunk({ lnum, lnum })
end, { desc = "Git stage current line" })

-- 單行 reset
keymap.set("n", "<leader>gr", function()
  local line = vim.fn.line(".")
  gitsigns.reset_hunk({ line, line })
end, { desc = "Git reset current line" })

-- 視覺選取 stage
keymap.set("v", "<leader>ga", function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  gitsigns.stage_hunk({ start_line, end_line })
end, { desc = "Git stage selected lines" })

-- 視覺選取 reset
keymap.set("v", "<leader>gr", function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  gitsigns.reset_hunk({ start_line, end_line })
end, { desc = "Git reset selected lines" })

keymap.set("n", "<leader>gd", "<cmd>lua require('gitsigns').diffthis(nil, {vertical = true, split = 'botright'})<CR>")

-- search
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fw", builtin.grep_string)
keymap.set("n", "<leader>FW", "\"ayiw:Telescope live_grep<CR><c-r>a", {desc = "rg search selected words"})
keymap.set("v", "<leader>FW", "\"ay:Telescope live_grep<CR><c-r>a", {desc = "rg search selected words"})
keymap.set("n", "<leader>fg", builtin.live_grep)
keymap.set("n", "<leader>fb", builtin.buffers)
keymap.set("n", "<leader>fd", builtin.treesitter)
keymap.set("n", "<leader>fh", builtin.help_tags)
keymap.set("v", "f", "y\"ayiw/<c-r>a<CR>", {desc = "search selected words"})
keymap.set("n", "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })
keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", { desc = "Search current word" })
keymap.set("v", "<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", { desc = "Search current word" })
keymap.set("n", "<leader>sf", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", { desc = "Search on current file" })

-- test
keymap.set("n", "<leader>tt", "<cmd>A<CR>") -- only for rails
keymap.set("n", "<leader>tj", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

keymap.set("n", "<leader>ta", function()
  require("neotest").run.attach()
end, { desc = "Attach nearest running test" })

keymap.set("n", "<leader>td", function()
  require("neotest").run.stop()
end, { desc = "Stop the nearest test" })

keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run the current file test" })

keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { desc = "Open test result output" })

-- keymap.set("n", "<leader>ts", function()
--   require("neotest").summary.toggle()
-- end, { desc = "Toggle test summary" })

-- DB UI
keymap.set("n", "<leader>du", "<cmd>DBUIToggle<CR>", { desc = "Toggle Dadbod UI" })
-- keymap.set("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>", { desc = "Find existing DBUI buffer" })
-- keymap.set("n", "<leader>dr", "<cmd>DBUIRenameBuffer<CR>", { desc = "Rename DBUI buffer" })
keymap.set("n", "<leader>dl", "<cmd>DBUILastQueryInfo<CR>", { desc = "Show last query info" })

-- marks
keymap.set("n", "<leader>mf", builtin.marks)
keymap.set("n", "<leader>md", "<cmd>delmarks a-zA-Z0-9<CR>")
local marks = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

for i, mark in ipairs(marks) do
  keymap.set("n", "<leader>mm" .. string.char(96 + i), "<cmd>mark " .. mark .. "<CR>", { noremap = true, silent = true })
end

for i, mark in ipairs(marks) do
  keymap.set("n", "m" .. string.char(96 + i), "'" .. mark .. "<CR>", { noremap = true, silent = true })
end

for i = 0, 9 do
  keymap.set("n", "<leader>mm" .. i, "<cmd>mark " .. i .. "<CR>", { noremap = true, silent = true })
  keymap.set("n", "m" .. i, "<cmd>'" .. i .. "<CR>", { noremap = true, silent = true })
end

-- split buffers
keymap.set("n", "<leader>w-", "<C-w>s", {desc = "split window horizontally"})
keymap.set("n", "<leader>w\\", "<C-w>v", {desc = "split window vertically"})
keymap.set("n", "<leader>wd", "<cmd>close<CR>", {desc = "close window"})
keymap.set("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", {desc = "toggle max window"})
keymap.set("n", "<leader>we", "<cmd>WinResizerStartResize<CR>", {desc = "quick resize window"})
