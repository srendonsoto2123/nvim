return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'hrsh7th/cmp-nvim-lsp'
  },
  require 'plugins.lsp.mason',
  require 'plugins.lsp.mason_lspconfig',
  require 'plugins.lsp.null_ls',
}
