local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not mason_status then
  vim.notify(mason, "error", {
    title = "Mason.nvim"
  })
  return
end

if not mason_lspconfig_status then
  vim.notify(mason_lspconfig, "error", {
    title = "Mason-lspconfig"
  })
  return
end

if not lspconfig_status then
  vim.notify(lspconfig, "error", {
    title = "Lspconfig"
  })
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    border = "rounded"
  }
})

mason_lspconfig.setup({
  ensure_installed = { "rust_analyzer", "sumneko_lua", "dockerls", "elixirls",
    "eslint", "yamlls", "bashls", "jsonls", "pyright" },
 })

local handlers = require("core.lsp.handlers")
handlers.setup()

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    })
    require("mapping")("lsp")
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup {
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
})

require("core.lsp.null_ls")
