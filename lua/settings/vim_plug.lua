local Plug = require( "utils.vim_plug" )
local neovim_dir = vim.fn.stdpath("data")

Plug.begin(neovim_dir .. "\\plugged")

  -- TEMAS
  Plug "rakr/vim-one"
  Plug( "folke/tokyonight.nvim", { branch = "main" } )
  Plug "EdenEast/nightfox.nvim"

  -- MOVIMIENTO
  Plug "christoomey/vim-tmux-navigator"
  Plug "phaazon/hop.nvim"

  -- UI - INTERFAZ
  Plug "scrooloose/nerdtree"
  Plug "nvim-lualine/lualine.nvim"
  Plug "rafcamlet/tabline-framework.nvim"
  Plug "kyazdani42/nvim-web-devicons"
  Plug "rcarriga/nvim-notify"
  Plug "xiyaowong/nvim-transparent"
  Plug "Pocco81/TrueZen.nvim"

  -- ESCRITURA
  Plug "jiangmiao/auto-pairs"
  Plug "windwp/nvim-ts-autotag"

  -- LANGUAGE SERVER PROTOCOL
  Plug "neovim/nvim-lspconfig"
  Plug "williamboman/nvim-lsp-installer"

  -- AUTOCOMPLETE
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/nvim-cmp'

  -- RESALTADO
  Plug( "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } )

  -- REQUISITOS
  Plug "nvim-lua/plenary.nvim"
  -- FUZZY FINDER
  Plug "nvim-telescope/telescope.nvim"
  -- EXTENSIONS
  Plug "nvim-telescope/telescope-fzy-native.nvim"
  Plug "nvim-telescope/telescope-media-files.nvim"

  -- SNIPPETS
  Plug "dcampos/nvim-snippy"
  Plug "dcampos/cmp-snippy"

  -- FORMAT
  Plug "onsails/lspkind-nvim"

  -- INTEGRACIÓN CON GIT
  Plug "tpope/vim-fugitive"

Plug.ends();
