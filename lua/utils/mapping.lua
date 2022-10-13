local keymap = vim.keymap.set

local Map = {}

function Map:new( mode, key )
  local instance = {
    mode = "",
    cmd = "",
    key = "",
    opts = {
      noremap = false,
      silent = false,
      expr = false,
      nowait = false,
      buffer = 0,
    },
  }

  setmetatable(instance, self)
  self.__index = self

  instance.mode = mode
  instance.key = key

  return instance
end

function Map:with_silent()
  self.opts.silent = true
  return self
end

function Map:with_expr()
  self.opts.expr = true
  return self
end

function Map:set_buffer( buffer )
  if buffer > -1 then
    self.opts.buffer = buffer
  else
    error( "Buffer no puede tener numeros negativos" )
  end
  return self
end

function Map:with_noremap()
  self.opts.remap = false
  return self
end

function Map:with_nowait()
  self.opts.nowait = true
  return self
end

function Map:map_cr( command_string )
  self.cmd = ( "<cmd>%s<CR>" ):format( command_string )
  return self
end

function Map:map_cu( command_string )
  self.cmd = ( "<cmd><C-u>%s<CR>" ):format( command_string )
  return self
end

function Map:map_cmd( command_string )
  self.cmd = command_string
  return self
end

local mapping = {}

function mapping.map_cr( mode, key, command_string )
  local map = Map:new( mode, key );
  return map:map_cr( command_string )
end

function mapping.map_cu( mode, key, command_string )
  local map = Map:new( mode, key );
  return map:map_cu( command_string )
end

function mapping.map_cmd( mode, key, command_string )
  local map = Map:new( mode, key )
  return map:map_cmd( command_string )
end

function mapping.set_maps( maps )
  for _, map in pairs( maps ) do
    local mode = map.mode
    local key = map.key
    local cmd = map.cmd
    local opts = map.opts
    keymap( mode, key, cmd, opts )
  end
end

return mapping

