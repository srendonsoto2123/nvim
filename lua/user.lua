local set = vim.opt

-- GLOBAL
vim.g.mapleader = " "
vim.g.one_allow_italics = 1

-- OPCIONES UI --
set.cmdheight = 2
set.completeopt = { "menuone", "noinsert", "preview" }
set.termguicolors = true
set.showmode = false
set.splitright = true
set.splitbelow = true
set.hlsearch = false
set.cursorline = true
set.wrap = false
set.scrolloff = 7
set.sidescrolloff = 5
set.relativenumber = true
set.laststatus = 3
set.linebreak = true
set.breakindent = true
set.colorcolumn = "81"
--set.background = "dark"
set.list = true
set.listchars = { trail = "»", eol = "", extends = "•", precedes = "•" }
-- END OPCIONES UI --

-- OPCIONES FUNCIONALIDAD --
set.clipboard = "unnamedplus"
set.undodir = vim.fn.stdpath("cache") .. "/undo"
set.hidden = true
set.updatetime = 300
set.writebackup = false
set.undofile = true
set.fileencoding = "utf-8"
set.autowrite = true
set.autowriteall = true
set.encoding = "utf-8"
set.smartcase = true
set.lazyredraw = true
-- END OPCIONES FUNCIONALIDAD --

-- OPCIONES DE ESCRITURA --
set.conceallevel = 0
set.smartindent = true
set.tabstop = 8
set.softtabstop = 2
set.shiftwidth = 2
set.smarttab = true
set.foldexpr = ""
set.foldmethod = "manual"
set.expandtab = true
set.matchpairs = "(:),{:},[:],<:>"
-- END OPCIONES ESCRITURA --

-- OPCIONES DE GUI

-- END OPCIONES GUI

-- User maps
require("mapping")("user")
