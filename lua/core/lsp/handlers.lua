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

  if vim.lsp.handlers["textDocument/hover"] ~= nil then
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
  end

  if vim.lsp.handlers["textDocument/signatureHelp"] ~= nil then
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
  end

  --if vim.lsp.handlers["textDocument/formatting"] ~= nil then
  --vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()")
  --end
end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
         augroup lsp_document_highlight
           autocmd! * <buffer>
           autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
           autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
         augroup END
         ]],
      false
    )
  end
end

local mapping = require "utils.mapping"
local lsp_keymaps = require "mapping.maps".setLspMaps

M.on_attach = function(client, bufnr)
  mapping.set_maps(lsp_keymaps(bufnr))
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', "v:lua.vim.lsp.omnifunc")

  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false;
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({
          bufnr = bufnr,
          timeout_ms = 8000,
        })
      end
    })
  end
end

local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_status then
  vim.notify(cmp_nvim_lsp, "error", {
    title = "Cmp nvim lsp"
  })
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M