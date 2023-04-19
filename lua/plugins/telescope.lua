return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-dap.nvim',
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        selection_strategy = "follow",
        selection_caret = "  ",
        prompt_prefix = "  ",
        file_ignore_patterns = { ".git", "node_modules", "target" },
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
    },
    init = function()
      require 'telescope' .load_extension 'fzy_native'
      require 'telescope' .load_extension 'media_files'
      require 'telescope' .load_extension 'dap'
    end
  },
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-telescope/telescope-dap.nvim',
}
