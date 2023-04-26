return {
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
      debug = true,
    })
  end
}
