return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
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
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        ensure_installed = { "rust_analyzer", "lua_ls", "dockerls", "elixirls",
          "eslint", "yamlls", "bashls", "jsonls", "pyright" },
      },
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        local null_ls = require('null-ls')
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local on_attach = require('utils.handlers').on_attach
        local sources = {
          -- Formateadores de código.
          -- formatting.prettier, -- Formateador de código prettier
          formatting.shellharden,
        }

        null_ls.setup({
          cmd = { 'nvim' },
          sources = sources,
          on_attach = on_attach,
          debug = false,
        })
      end
    },
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
