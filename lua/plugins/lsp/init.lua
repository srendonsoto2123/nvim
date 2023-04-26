return {
  'neovim/nvim-lspconfig',
  dependencies = {
    require 'plugins.lsp.mason',
    require 'plugins.lsp.mason_lspconfig',
    require 'plugins.lsp.null_ls',
    'hrsh7th/cmp-nvim-lsp'
  },
  config = function()
    local mason_lspconfig = require 'mason-lspconfig'
    local handlers = require 'utils.handlers'
    local lspconfig = require 'lspconfig'

    handlers.setup()

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = handlers.on_attach,
          capabilities = handlers.capabilities,
        })
        require("mapping")("lsp")
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT"
              },
              diagnostics = {
                globals = { "vim" }
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
              }
            }
          },
          on_attach = handlers.on_attach,
          capabilities = handlers.capabilities,
        }
      end,
      ["elixirls"] = function()
        lspconfig.elixirls.setup {
          cmd = { "/home/srendonsoto2123/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh" },
          on_attach = handlers.on_attach,
          capabilities = handlers.capabilities,
        }
      end,
      ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
          cmd = {
            "rustup", "run", "stable", "rust-analyzer",
          },
          on_attach = handlers.on_attach,
          capabilities = handlers.capabilities,
        })
      end,
    });
  end,
}
