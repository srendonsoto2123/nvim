local lsp_status, _ = pcall(require, "lspconfig")

if not lsp_status then
  vim.notify("Erros en lsp no hay plugin lspconfig", "error", {
    title = "Lsp Init"
  })
  return
end

require "mapping" "lsp"
require "core.lsp.config"
require "core.lsp.handlers".setup()
require "core.lsp.null_ls"
