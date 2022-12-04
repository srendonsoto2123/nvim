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


