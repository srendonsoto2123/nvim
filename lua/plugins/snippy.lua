return {
  'dcampos/nvim-snippy',
  dependencies = {
    'dcampos/cmp-snippy'
  },
  opts = {
    snippet_dirs = vim.fn.stdpath('config') .. '/snippets',
    scopes = {
      _ = {},
    },
    mappings = {
      is = {
        ["<Tab>"] = "expand_or_advance",
        ["<S-Tab>"] = "previous",
      },
    }
  }
}
