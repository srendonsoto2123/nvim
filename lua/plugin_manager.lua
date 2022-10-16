-- Archivo para hacer el cambio de vim_plug a packer para hacer uso de los 
-- plugins
local status_packer, packer = pcall(require, "packer")

if not status_packer then
  local path_install = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  vim.notify(packer)
  return
end

local setup = function(use)
  use "wbthomason/packer.nvim"
  
  -- Temas de colores
  use { "folke/tokyonight.nvim", branch = "main" }
  use { "EdenEast/nightfox.nvim" }

  -- Movimiento en el editor
  use { "phaazon/hop.nvim" }

  -- Interfaz
  use { "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
  }
  use { "feline-nvim/feline.nvim" }
  use { "rcarriga/nvim-notify" }


  -- LSP Language Server Protocol
  use { "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    }
  }
  -- Formato para el CMP
  use "onsails/lspkind-nvim" 

  use {
    "hrsh7th/nvim-cmp",
    require = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp",
      { "dcampos/nvim-snippy", requires = "dcampos/cmp-snippy" }
    }
  }

  -- Resaltado de sintaxis
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- Telescope
  use { "nvim-telescope/telescope.nvim",
      require = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-media-files.nvim",
      }
  }
 

  -- Snippets para autocompletado de funciones
  use { "dcampos/cmp-snippy",
    requires = {
      "dcampos/nvim-snippy",
    }
  }

  -- Integración con git 
  use { "tpope/vim-fugitive" }

  use { "mfussenegger/nvim-dap" }
end

local setup_2 = function(use)
  use "wbthomason/packer.nvim"
end

return packer.startup(setup)
