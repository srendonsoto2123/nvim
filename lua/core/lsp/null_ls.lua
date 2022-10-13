local status_null_ls, null_ls = pcall(require, "null-ls")

if not status_null_ls then
  vim.notify("No se ha encontrado el plugin null-ls, parece que no ha sido instalado", "error", {
    title = "null-ls",
  })
  return
end

local formatting = null_ls.builtins.formatting
--local diagnostics = null_ls.builtins.diagnostics

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local sources = {
  -- Formateadores de código.
  --formatting.prettier, -- Formateador de código prettier
  --formatting.lua_format, -- Formateador de código para lua
  --formatting.black, -- Para python
  --formatting.brittany, -- Para haskell
  --formatting.gofmt, -- Para golang
  --formatting.nginx_beautifier, -- Para archivo de configuraciones nginx
  formatting.rustfmt, -- Para Rust
  --formatting.shfmt, -- Para shell-script
  --formatting.sqlformat, -- Para SQL
  --formatting.taplo, -- Para TOML (Toolkit)
  --formatting.terrafmt, -- Para terraform

  -- Diagnosticos del código.
  --diagnostics.actionlint, -- Para workflow github
  --diagnostics.credo, -- Para elixir
  --diagnostics.eslint, -- Para desarrollo web
  --diagnostics.flake8, -- Para python
  --diagnostics.shellcheck, -- Para shell-script
}

null_ls.setup({
  sources = sources,
  on_attach = on_attach
})
