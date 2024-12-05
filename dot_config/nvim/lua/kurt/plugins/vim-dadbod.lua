local status, dadbod = pcall(require, "vim-dadbod")
if not status then
  return
end

dadbod.setup({
  config = function()
    vim.g.db_ui_save_location = "~/.config/nvim/db_ui_queries" -- 保存查詢的位置
    vim.g.db_ui_auto_execute_table_helpers = 1 -- 自動執行表輔助查詢
    -- 自定義連線，如果需要直接在 Neovim 中設定，則可以在 vim-dadbod 啟動後指定連線：
    -- vim.g.dbs = {
    --   my_postgres = 'postgres://user:password@localhost:5432/my_database',
    --   my_mysql = 'mysql://user:password@localhost:3306/my_database',
    --   my_sqlite = 'sqlite:///path/to/my_database.db'
    -- }
    -- 如果是 rails 專案可以在 .env file 新增
    -- DATABASE_URL="mysql://user:password@localhost:3306/database_name"
  end
})
