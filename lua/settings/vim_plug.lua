local Plug = require("utils.vim_plug")
local neovim_dir = vim.fn.stdpath("data")

Plug.begin(neovim_dir .. "\\plugged")

-- TEMAS
Plug("folke/tokyonight.nvim", { branch = "main" })
Plug "EdenEast/nightfox.nvim"

-- MOVIMIENTO
Plug "christoomey/vim-tmux-navigator"
Plug "phaazon/hop.nvim"

-- UI - INTERFAZ
Plug "kyazdani42/nvim-tree.lua"
Plug "nvim-lualine/lualine.nvim"
Plug "feline-nvim/feline.nvim"
Plug "rafcamlet/tabline-framework.nvim"
Plug "kyazdani42/nvim-web-devicons"
Plug "rcarriga/nvim-notify"
Plug "SmiteshP/nvim-gps"

-- ESCRITURA
Plug "jiangmiao/auto-pairs"
Plug "windwp/nvim-ts-autotag"

-- LANGUAGE SERVER PROTOCOL
Plug "neovim/nvim-lspconfig"
Plug "williamboman/nvim-lsp-installer"
Plug "jose-elias-alvarez/null-ls.nvim"
-- FORMAT
Plug "onsails/lspkind-nvim"

-- AUTOCOMPLETE
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp'

-- RESALTADO
Plug("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

-- REQUISITOS
Plug "nvim-lua/plenary.nvim"
-- FUZZY FINDER
Plug "nvim-telescope/telescope.nvim"
-- EXTENSIONS
Plug "nvim-telescope/telescope-fzy-native.nvim"
Plug "nvim-telescope/telescope-media-files.nvim"

-- SNIPPETS
Plug "dcampos/cmp-snippy"
Plug "dcampos/nvim-snippy"

-- INTEGRACIÓN CON GIT
Plug "tpope/vim-fugitive"

Plug.ends();
