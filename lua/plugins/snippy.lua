return {
  'dcampos/nvim-snippy',
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
