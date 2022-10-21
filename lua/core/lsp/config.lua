require("mason").setup()
local installer_state, mason_installer = pcall(require, "mason-lspconfig")
if not installer_state then
  vim.notify(mason_installer, "error", {
    title = "Mason lspconfig"
  })
  return
end

local handlers = require"core.lsp.handlers"

mason_installer.setup({
   ensure_installed = { "rust_analyzer", "sumneko_lua", "dockerls", "elixirls" },
   ui = {
      icons = {
         server_installed = "✓",
         server_pending = "➜",
         server_unistalled = "✗",
    }
  }
})

mason_installer.setup_handlers({
  ["sumneko_lua"] = function()
  end,
})

--mason_installer.on_server_ready(function( server )
   --local opts = {
      --on_attach = handlers.on_attach,
      --capabilities = handlers.capabilities,
   --}
--
   --server:setup( opts )
--end)


