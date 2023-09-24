local mapping = require "utils.mapping"
local lsp_keymaps = require "mapping.maps".setLspMaps

local M = {}

-- TODO: Backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function hover_support(client)
  if client.supports_method('textDocument/hover') then
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
  end
end

local function signature_help_support(client)
  if client.supports_method('textDocument/signatureHelp') then
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
  end
end

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup('lsp_document_highlight', {})
    vim.api.nvim_create_autocmd('CursorHold', {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
      end
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
      end
    })
  end
end

local function format_on_save(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(cliente)
            local ft = vim.bo.filetype
            local have_nls = #require('null-ls.sources').get_available(ft, 'NULL_LS_FORMATTING') > 0
            if have_nls then
              return client.name == 'null-ls'
            else
              return cliente.name ~= "tsserver" and client.name ~= 'null-ls'
            end
          end
        })
        vim.notify('Autoformat finish', 2, {
          title = "Format document",
          icon = " ",
        });
      end
    })
  end
end

M.on_attach = function(client, bufnr)
  mapping.set_maps(lsp_keymaps(bufnr))
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', "v:lua.vim.lsp.omnifunc")

  lsp_highlight_document(client, bufnr)
  format_on_save(client, bufnr)

  hover_support(client)
  signature_help_support(client)
end

local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_status then
  return M
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
