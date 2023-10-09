return {
  'windwp/nvim-ts-autotag',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_filetypes = { 'TelescopePrompt', 'vim' },
    },
  },
  -- COLOR SCHEME
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end
  },
  {
    'smoka7/hop.nvim',
    opts = {
      keys = 'asdfghjklñqwertyuiopzxcvbnm'
    },
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require 'notify'
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      {
        'kyazdani42/nvim-web-devicons',
        lazy = true,
        opts = {
          default = true,
        }
      },
    },
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require 'nvim-tree'.setup()
    end
  }
}
