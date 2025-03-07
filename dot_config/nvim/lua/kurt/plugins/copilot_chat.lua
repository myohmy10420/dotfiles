local setup, copilot_chat = pcall(require, "CopilotChat")

if not setup then
  return
end

copilot_chat.setup({
  -- 啟用面板設置
  panel = {
    enabled = true,        -- 啟用 Copilot 面板
    auto_open = false,     -- 是否自動打開面板
    auto_close = true,     -- 是否在建議選擇後自動關閉面板
    height = 10,           -- 設置面板高度
    width = 80,            -- 設置面板寬度
  },

  -- 設置建議
  suggestion = {
    enabled = true,        -- 啟用建議功能
    auto_trigger = true,   -- 啟用自動觸發建議
    debounce = 200,        -- 建議觸發延遲，單位為毫秒
    keymap = {
      accept = "<CR>",      -- 使用 Enter 鍵來接受建議
      next = "<Tab>",       -- 使用 Tab 鍵來切換到下一個建議
      prev = "<S-Tab>",     -- 使用 Shift+Tab 切換上一個建議
    },
  },

  -- 設置聊天
  chat = {
    enabled = true,        -- 啟用 Copilot 聊天功能
    open_on_start = false, -- 啟動時是否自動打開聊天面板
    keymaps = {
      toggle = "<leader>cc",  -- 使用 <leader>cc 來切換聊天面板
    },
  },
})

-- 設置 CopilotChat 的開啟
vim.g.copilot_chat_enable = true
