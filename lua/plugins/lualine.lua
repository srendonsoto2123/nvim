return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function()
    return {
      globalstatus = true,
      options = {
        theme = 'tokyonight',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'diagnostics' },
        lualine_x = {
          {
            'buffers',
            show_filename_only = true,
            hide_filename_extension = true,
            show_modified_status = true,
            mode = 4,

            max_length = vim.o.columns * 2 / 3,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = { 'filename' },
        lualine_b = { 'filetype' },
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = {},
      },
      disable_filetypes = {
        statusline = { 'NvimTree' },
        winbar = { 'NvimTree' },
      },
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    }
  end,
}
