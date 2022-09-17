local Plug = require("utils.vim_plug")
local neovim_dir = vim.fn.stdpath("data")

Plug.begin(neovim_dir .. "\\plugged")

-- TEMAS
Plug("folke/tokyonight.nvim", { branch = "main" })
Plug "EdenEast/nightfox.nvim"

-- MOVIMIENTO
Plug "christoomey/vim-tmux-navigator" -- Puede no ser útil
Plug "phaazon/hop.nvim"

-- UI - INTERFAZ
Plug "kyazdani42/nvim-tree.lua" -- Visualizador de archivos
Plug "nvim-lualine/lualine.nvim" -- Plugins repetidos statusline
-- Plug "feline-nvim/feline.nvim" -- Plugins repetidos statusline
Plug "kyazdani42/nvim-web-devicons" -- Plugin para iconos.
Plug "rcarriga/nvim-notify" -- Plugin para notificaciones en neovim

-- ESCRITURA
Plug "jiangmiao/auto-pairs" -- Plugin para autopairs. Posible cambio
Plug "windwp/nvim-ts-autotag" -- Plugin para autotags.

-- LANGUAGE SERVER PROTOCOL
Plug "neovim/nvim-lspconfig" -- Plugin para las configuraciones del lsp
Plug "williamboman/nvim-lsp-installer" -- Plugin para instalar los server del lsp
Plug "jose-elias-alvarez/null-ls.nvim" -- Plugin para funcionalidades lsp extras
-- FORMAT
Plug "onsails/lspkind-nvim" -- Plugin para formatear salidas de funciones

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
