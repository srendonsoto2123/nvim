local status_null_ls, null_ls = pcall(require, "null-ls")

if not status_null_ls then
   vim.notify("No se ha encontrado el plugin null-ls, parece que no ha sido instalado", "error", {
      title = "null-ls",
   })
   return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
   sources = {
      formatting.eslint,
      formatting.stylua
   },

   on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      end
   end
})
