vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness
local builtin = require('telescope.builtin')

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
keymap.set("n", "<leader>d", ":bd<CR>")
keymap.set("n", "<leader>ww", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", {desc = "toggle nvim-tree"})

keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", {desc = "switch from terminal"})
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", {desc = "switch from terminal"})
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", {desc = "switch from terminal"})
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", {desc = "switch from terminal"})

-- git
keymap.set("n", "<leader>gs", builtin.git_status)
keymap.set("n", "<leader>gb", ":Git blame<CR>")
keymap.set("n", "<leader>gt", ":Git difftool<CR>")
keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>")

-- search
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fw", builtin.grep_string)
keymap.set("n", "<leader><C-f><C-w>", "\"ayiw:Telescope live_grep<CR><c-r>a", {desc = "rg search selected words"})
keymap.set("v", "<leader><C-f><C-w>", "\"ay:Telescope live_grep<CR><c-r>a", {desc = "rg search selected words"})
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
keymap.set("n", "<leader>tf", "<cmd>call RunCurrentSpecFile()<CR>")
keymap.set("n", "<leader>tj", "<cmd>call RunNearestSpec()<CR>")
keymap.set("n", "<leader>ta", "<cmd>call RunAllSpecs()<CR>")
keymap.set("n", "<leader>td", "<cmd>Tkill<CR> :Tclose!<CR>")

-- marks
keymap.set("n", "<leader>mf", builtin.marks)
keymap.set("n", "<leader>md", ":delmarks a-zA-Z0-9<CR>")
local marks = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

for i, mark in ipairs(marks) do
  keymap.set("n", "<leader>mm" .. string.char(96 + i), ":mark " .. mark .. "<CR>", { noremap = true, silent = true })
end

for i, mark in ipairs(marks) do
  keymap.set("n", "m" .. string.char(96 + i), "'" .. mark .. "<CR>", { noremap = true, silent = true })
end

for i = 0, 9 do
  keymap.set("n", "<leader>mm" .. i, ":mark " .. i .. "<CR>", { noremap = true, silent = true })
  keymap.set("n", "m" .. i, ":'" .. i .. "<CR>", { noremap = true, silent = true })
end

-- split buffers
keymap.set("n", "<leader>w-", "<C-w>s", {desc = "split window horizontally"})
keymap.set("n", "<leader>w\\", "<C-w>v", {desc = "split window vertically"})
keymap.set("n", "<leader>wd", "<cmd>close<CR>", {desc = "close window"})
keymap.set("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", {desc = "toggle max window"})
keymap.set("n", "<leader>we", "<cmd>WinResizerStartResize<CR>", {desc = "quick resize window"})
