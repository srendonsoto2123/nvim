local status_feline, feline = pcall(require, "feline")

-- Añadir Modo 
-- Añadir Imagen para el modo
-- Añadir el nombre del archivo
-- Añadir Aviso modificación del archivo.
-- Añadir Aviso de archivo onlyread
-- Lsp server activo
-- Treesitter activo
-- Filetype archivo
-- Posicion
-- Imagen para ramas de git
-- Posicionamiento en la rama.
-- Lsp diagnostics
-- Cambios en los archivos (git)
-- Porcentaje del archivo recorrido.
-- Tipo de codificación.
-- Imagen del filetype o icono filetype

if not status_feline then
  vim.notify(feline, {
    title = "feline.nvim"
  })
  return
end

local lsp = require("feline.providers.lsp")
local vi_mode = require("feline.providers.vi_mode")

local force_inactives = {
  filetypes = {},
}

local tokyonightstorm = {
  bg = "#24283b",
  black = "#24283b",
  yellow = "#e0af68",
  cyan = "#7dcfff",
  oceanblue = "#7aa2f7",
  green = "#9ece6a",
  orange = "#e0af68",
  violet = "#bb9af7",
  magenta = "#bb9af7",
  white = "#c0caf5",
  fg = "#c0caf5",
  skyblue = "#7dcfff",
  red = "#f7768e",
}

local modes_text = {
  NORMAL = " ",
  VISUAL = " ",
  OP = " ",
  INSERT = " ",
  LINES = " ",
  BLOCK = " ",
  REPLACE = " ",
  ["V-REPLACE"] = " ",
  MORE = " ",
  SELECT = " ",
  COMMAND = " ",
  SHELL = " ",
  TERM = " ",
  NONE = "  ",
  CONFIRM = " "
}

local modes_colors = {
  NORMAL = "",
  VISUAL = "",
  OP = "",
  INSERT = "",
  LINES = "",
  BLOCK = "",
  REPLACE = "",
  ["V-REPLACE"] = "",
  MORE = "",
  SELECT = "",
  COMMAND = "",
  SHELL = "",
  TERM = "",
  NONE = "",
  CONFIRM = ""
}

local components = {
  active = {
    {}, {}, {},
  },
  inactive = {
    {}, {}, {},
  },
}

-- Primer componente show mode
table.insert(components.active[1], {
  -- Información del componente
  provider = function()
    return string.sub(vi_mode.get_vim_mode(), 1, 3) .. " - "
  end,
  hl = function()
    return {
      name = "Show mode",
      bg = require("feline.providers.vi_mode").get_mode_color(),
      fg = "black",
      style = 'bold',
    }
  end,

  left_sep = "left_rounded",
})

-- Segundo componente imagen para el show mode 
table.insert(components.active[1], {
  provider = function()
    return modes_text[vi_mode.get_vim_mode()]
  end,
  hl = function()
    return {
      name = "",
      bg = vi_mode.get_mode_color(),
      fg = "black",
      style = "bold",
    }
  end,
  right_sep = "right_rounded",
})

-- Tercer componente para el nombre del archivo
table.insert(components.active[1], {
  -- Información del componente
  provider = 'position',
  hl = function()
    local opts = {}
    
  end,
  left_sep = " ",
  right_sep = " ",
})


require("feline").setup()
require("feline").winbar.setup()
