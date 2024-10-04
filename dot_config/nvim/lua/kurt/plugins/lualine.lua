local setup, comment = pcall(require, "lualine")
if not setup then
  return
end

local gruvbox = require'lualine.themes.gruvbox'

comment.setup({
  options = {
    theme = gruvbox
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      },
    },
  },
})
