--local lsp_status, _ = pcall(require, "lspconfig")

--if not lsp_status then
  --vim.notify("Erros en lsp no hay plugin lspconfig", "error", {
    --title = "Lsp Init"
  --})
  --return
--end
--
--require("mapping")("lsp")
--require("core.lsp.config")
--require("core.lsp.null_ls")

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
                          "eslint", "yamlls", "bashls", "jsonls", "pyright"},
  }
)

local handlers = require("core.lsp.handlers")

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = handlers.on_attach,
    })
    require("core.lsp.handlers").setup()
    require("mapping")("lsp")
  end,
})

require("core.lsp.null_ls")
