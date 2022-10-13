local status_telescope, telescope = pcall(require, "telescope")

if not status_telescope then
   return
end

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    selection_strategy = "follow",
    selection_caret = "  ",
    prompt_prefix = "  ",
    file_ignore_patterns = { ".git", "node_modules" },
  },
  pickers = {},
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "fd",
    },
  },
})

require("mapping")"telescope"
require"telescope".load_extension"fzy_native"
require"telescope".load_extension"media_files"
