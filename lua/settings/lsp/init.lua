local lsp_status, _ = pcall(require, "lspconfig")

if not lsp_status then
   return
end

require"settings.lsp.config"
require"settings.lsp.handlers".setup()
