local setup, neotest = pcall(require, "neotest")
if not setup then
  return
end

neotest.setup({
  icons = {
    passed = "😎",
    running = "🤔",
    failed = "💩",
    skipped = "💤",
    unknown = "👽",
  },
  adapters = {
    require("neotest-rspec")({
      rspec_cmd = function()
        return vim.tbl_flatten({
          "bundle",
          "exec",
          "rspec",
          "--tty",
        })
      end,
      root_files = { "Gemfile", ".rspec", ".gitignore" },
      filter_dirs = { ".git", "node_modules" },
      transform_spec_path = function(path)
        return path
      end,
      formatter = function()
        return "NeotestFormatter"
      end
    }),
  },
})
