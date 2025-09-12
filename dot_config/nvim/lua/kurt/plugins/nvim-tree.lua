local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

local function avante_add_files()
  local api = require("nvim-tree.api")

  -- 獲取目前游標所在的檔案節點
  local node = api.tree.get_node_under_cursor()
  if not node then
    print("No file selected")
    return
  end

  local filepath = node.absolute_path
  print("Selected file:", filepath) -- Debugging purpose

  -- 這裡可以加入您的 Avante 相關邏輯
  local relative_path = require("avante.utils").relative_path(filepath)
  local sidebar = require("avante").get()

  local open = sidebar:is_open()
  -- 確保 Avante 側邊欄已打開
  if not open then
    require("avante.api").ask()
    sidebar = require("avante").get()
  end

  sidebar.file_selector:add_selected_file(relative_path)

  -- 如果之前未開啟 Avante 側邊欄，則關閉
  if not open then
    sidebar.file_selector:remove_selected_file("nvim-tree")
  end
end

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- 載入預設快捷鍵
  api.config.mappings.default_on_attach(bufnr)

  -- 設定自訂義快捷鍵
  vim.keymap.set("n", "oa", avante_add_files, opts("Avante Add Files"))
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
  on_attach = my_on_attach,
})
