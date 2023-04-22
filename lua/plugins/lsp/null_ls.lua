return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function() 
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    -- local diagnostics = null_ls.builtin.diagnostics
    local on_attach = require('utils.handlers').on_attach
    local sources = {
      -- Formateadores de código.
      formatting.prettier, -- Formateador de código prettier
      formatting.rustfmt, -- Para Rust
    }

    null_ls.setup({
      sources = sources,
      on_attach = on_attach,
    })
  end
}
