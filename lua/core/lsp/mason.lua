local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")

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


local mason_config = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    border = "rounded"
  }
}

local lsp_mason_config = {
  ensure_installed = { "rust_analyzer", "sumneko_lua", "dockerls", "elixirls",
    "eslint", "yamlls", "bashls", "jsonls", "pyright" },
}

local Mason = {
  __call = function()
    mason.setup(mason_config)
    mason_lspconfig.setup(lsp_mason_config)
  end,
}

function Mason:new(config_mason, config_lsp)
  local instance = {
    mason = config_mason or mason_config,
    lspconfig_mason = config_lsp or lsp_mason_config,
  }

  setmetatable(instance, self)
  self.__index = self

  return instance
end

function Mason:__call()
  mason.setup(self.config_mason)
  mason_lspconfig.setup(self.config_lsp)
  return self
end

function Mason:setup_handlers(config_handlers)
  self.lspconfig_mason.setup_handlers(config_handlers)
  return self
end

local R = {}

function R.setup_handlers()
  local m = Mason:new()
  m()
end

-- SECCIÓN SETUPS PARA LOS LSP

return R
