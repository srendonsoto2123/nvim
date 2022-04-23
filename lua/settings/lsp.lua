local mapping = require("utils.mapping")
local map_cr = mapping.map_cr
--local map_cmd = mapping.map_cmd
--local map_cu = mapping.map_cu

local on_attach = function( client, bufnr )
  local fn = "lua vim.lsp.buf."

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local maps = {
    map_cr( "n", "gD", fn .. "declaration()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "gd", fn .. "definition()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "K", fn .. "hover()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "gi", fn .. "implementation()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>h", fn .. "signature_help()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>aw", fn .. "add_workspace_folder()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>rw", fn .. "remove_workwpace_folder()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>lw", "lua print(vim.inspect( vim.lsp.buf.list_workspace_folders() ))" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>D", fn .. "type_definition()" ):set_buffer( bufnr ):with_silent():with_noremap(),
    map_cr( "n", "<Leader><Leader>rn", fn .. "rename()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>ca", fn .. "code_action()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "gr", fn .. "references()" ):set_buffer( bufnr ):with_noremap():with_silent(),
    map_cr( "n", "<Leader><Leader>f", fn .. "formatting()" ):set_buffer( bufnr ):with_noremap():with_silent(),
  }

  mapping.set_maps( maps )
end

local lsp_installer = require"nvim-lsp-installer"
local lspcapa = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").update_capabilities( lspcapa )

lsp_installer.settings({
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
