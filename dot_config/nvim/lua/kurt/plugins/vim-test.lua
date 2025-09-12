vim.g["test#strategy"] = "neoterm"
-- vim.g["test#ruby#bundle_exec"] = 1 -- 如果有偵查到 Gemfile 則用 bundle exec rspec，預設已經是 true(1)
vim.g["test#ruby#use_binstubs"] = 0 -- 不要找到 ./bin/rspec 就用 ./bin/rspec，設定false(0)
