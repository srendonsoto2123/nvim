return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function()
    local function lsp_component()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end
    local component = {
      lsp_component,
      icon = '  LSP:',
    }
    return {
      globalstatus = true,
      always_divide_middle = true,
      options = {
        theme = 'tokyonight',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { component, 'diagnostics' },
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
        lualine_b = { 'filetype', 'filesize' },
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
