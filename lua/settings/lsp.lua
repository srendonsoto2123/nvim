local mapping = require("utils.mapping")
local setLspMaps = require("mapping.mapeos").setLspMaps

local on_attach = function( client, bufnr )
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local maps = setLspMaps(bufnr)

  mapping.set_maps( maps )
end

local lsp_installer = require"nvim-lsp-installer"
local lspcapa = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").update_capabilities( lspcapa )

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
    on_attach = on_attach,
    capabilities = capabilities,
  }

  server:setup( opts )
end)
