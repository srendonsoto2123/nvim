local installer_state, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_state then
   return
end

local handlers = require"settings.lsp.handlers"

lsp_installer.settings({
   ensure_installed = { "rust_analyzer", "sumneko_lua" },
   ui = {
      icons = {
         server_installed = "✓",
         server_pending = "➜",
         server_unistalled = "✗",
    }
  }
})

lsp_installer.on_server_ready(function( server )
   local opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
   }

   server:setup( opts )
end)


