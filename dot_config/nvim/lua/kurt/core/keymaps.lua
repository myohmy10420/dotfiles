vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

-- general key maps
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

keymap.set("n", "<leader>wh", "<C-w>s", {desc = "split window horizontally"})
keymap.set("n", "<leader>wv", "<C-w>v", {desc = "split window vertically"})
keymap.set("n", "<leader>wd", "<cmd>close<CR>", {desc = "close window"})
keymap.set("n", "<leader>wm", "<cmd>MaximizerToggle<CR>", {desc = "toggle max window"})
keymap.set("n", "<leader>we", "<cmd>WinResizerStartResize<CR>", {desc = "quick resize window"})

keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", {desc = "toggle nvim-tree"})

-- keymap.set("n", "<leader>tc", ":tabnew<CR>", {desc = "create tab"})
-- keymap.set("n", "<leader>td", ":tabclose<CR>", {desc = "close tab"})
-- keymap.set("n", "<leader>tl", ":tabn<CR>", {desc = "go to next tab"})
-- keymap.set("n", "<leader>th", ":tabp<CR>", {desc = "go to previous tab"})

keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

keymap.set("n", "<leader>tf", "<cmd>call RunCurrentSpecFile()<CR>")
keymap.set("n", "<leader>tj", "<cmd>call RunNearestSpec()<CR>")
keymap.set("n", "<leader>ta", "<cmd>call RunAllSpecs()<CR>")
keymap.set("n", "<leader>td", "<cmd>Tkill<CR> :Tclose!<CR>")

local builtin = require('telescope.builtin')
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fg", builtin.live_grep)
keymap.set("n", "<leader>fb", builtin.buffers)
keymap.set("n", "<leader>fh", builtin.help_tags)
keymap.set("n", "<leader>fw", builtin.grep_string)
keymap.set("n", "<leader>fs", builtin.git_status)

keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", {desc = "switch from terminal"})
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", {desc = "switch from terminal"})
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", {desc = "switch from terminal"})
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", {desc = "switch from terminal"})

keymap.set("n", "<leader>ag<space>", ":T rg<space>")
keymap.set("n", "<leader>agw", '"ayiw:T rg<space><c-r>a<space>')
keymap.set("n", "<leader>agd", "\"ayiw:T rg<space>'def<space><c-r>a'<space>")
keymap.set("v", "<leader>fw", 'y"ayiw:T rg<space><c-r>a<space>', {desc = "rg search selected words"})
keymap.set("v", "<leader>fd", "y\"ayiw:T rg<space>'def<space><c-r>a'<space>", {desc = "rg search selected words"})
keymap.set("v", "f", "y\"ayiw/<c-r>a<CR>", {desc = "search selected words"})

keymap.set("n", "<leader>gb", ":Git blame<CR>")
