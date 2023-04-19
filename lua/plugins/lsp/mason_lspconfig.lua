return {
  'williamboman/mason-lspconfig.nvim',
  opts = {
    ensure_installed = { "rust_analyzer", "lua_ls", "dockerls", "elixirls",
    "eslint", "yamlls", "bashls", "jsonls", "pyright" },
  },
  init = function()
    local handlers = require 'core.lsp.handlers'
    local lspconfig = require 'lspconfig'
    handlers.setup()
    require 'mason-lspconfig' .setup_handlers({
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
        }
      end,
      ["elixirls"] = function()
        lspconfig.elixirls.setup {
          cmd = { "/home/srendonsoto2123/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh" }
        }
      end,
      ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
          cmd = {
            "rustup", "run", "stable", "rust-analyzer",
          }
        })
      end,
    });
  end
}
