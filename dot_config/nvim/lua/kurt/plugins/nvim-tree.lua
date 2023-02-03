local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documents
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIdentMaker guifg=#3FC5FF ]])

nvimtree.setup({
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "▸", -- icon when folder is closed
          arrow_open = "▾", -- icon when folder is open
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
  git = {
    ignore = false,
  },
})
