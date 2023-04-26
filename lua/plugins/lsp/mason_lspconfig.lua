return {
  'williamboman/mason-lspconfig.nvim',
  opts = {
    ensure_installed = { "rust_analyzer", "lua_ls", "dockerls", "elixirls",
    "eslint", "yamlls", "bashls", "jsonls", "pyright" },
  },
}
