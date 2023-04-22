return {
  {
    'jiangmiao/auto-pairs',
    init = function()
      vim.g.AutoPairsFlyMode = 1
      vim.g.AutoPairsMapCh = 0
      vim.g.AutoPairsShortcutToggle = '<M-}>'
    end
  },
  'windwp/nvim-ts-autotag',
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
    'kyazdani42/nvim-web-devicons',
    lazy = true,
    opts = {
      default = true,
    }
  },
  {
    'phaazon/hop.nvim',
    opts = {
      keys = 'asdfghjklñqwertyuiopzxcvbnm'
    }
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
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require 'nvim-tree'.setup()
    end
  }
}
