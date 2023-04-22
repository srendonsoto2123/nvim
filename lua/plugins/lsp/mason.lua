return {
  'wiliamboman/mason.nvim',
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = "rounded"
    }
  },
  build = ':MasonUpdate',
}
