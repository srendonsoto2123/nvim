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
         focusable = false,
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
   if client.resolved_capabilities.document_highlight then
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
   lsp_highlight_document(client)
   local file = io.open("./client.txt", "a")
   file:write(vim.inspect(client))
   file:close()
end

local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities

return M
