local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

-- enable keybinds for avaliable lsp server
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>s", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>s", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure javascript server
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure javascript lint server
lspconfig["quick_lint_js"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure ruby server
-- :lua print(vim.fn.execute("LspInfo")) 可以看 lsp log
lspconfig["solargraph"].setup({
  capabilities = capabilities,
  -- Lspsaga not support ruby will
  -- on_attach = on_attach,
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gm", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }) -- 嘗試跳到宣告該 method 的地方
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true }) -- 當前專案搜尋選取的 references ，應該是被宣告且可以被調用的 object
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gsm", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true }) -- 當前專案模糊搜尋 method
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gls", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true }) -- 當前檔案列出所有 defined class， module 和 method
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true }) -- 對選取的字顯示一些資訊

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gx", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true }) -- 當前專案所有檔案修改選取的字，會開啟一堆被修改的檔案且不會先直接存檔
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gx", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true }) -- 不知道怎麼用
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gx", "<Cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true }) -- 不知道怎麼用
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gx", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true }) -- 不知道怎麼用
  end,
  settings = {
    solargraph = {
      -- raichu 讀取 inherit_gem: rubocop-github 會有問題
      diagnostics = false,
      -- bundle exec solargraph
      -- useBundler = true,
      -- 禁用加载 Rails 共享配置文件
      -- loadRbconfig = false,
    }
  }
})

-- configure sql server
lspconfig["sqlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure yaml server
lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure json server
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
-- typescript.setup({
--   server = {
--     capabilities = capabilities,
--     on_attach = on_attach,
--   },
-- })

-- configure lua server (with special settings)
-- lspconfig["sumneko_lua"].setup({
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
