local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
    {
      file_ignore_patterns = {
        "node_modules"
      },
    },
  },
})
