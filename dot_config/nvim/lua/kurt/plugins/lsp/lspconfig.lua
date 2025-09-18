local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

-- LSP 按鍵綁定
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  -- 跳轉和檢視
  keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- 跳到定義
  keymap.set("n", "gr", vim.lsp.buf.references, opts) -- 查看引用
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- 跳到實作
  keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- 跳到型別定義
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- 顯示文檔
  keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- 程式碼動作
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 重新命名
  keymap.set("n", "<leader>f", vim.lsp.buf.format, opts) -- 格式化
end

-- 設定能力
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 語言伺服器設定
-- Ruby
lspconfig.solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- JavaScript/TypeScript
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Python
lspconfig.pylsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
