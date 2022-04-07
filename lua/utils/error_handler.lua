local ErrorHandler = {}

local default_handler = function( mensaje, result )
  print( mensaje .. " " .. result )
end

function ErrorHandler:new( funcion, handler )
  local instance = {
    status = false,
    funcion = nil,
    handler = nil,
    result = nil,
  }
  setmetatable( instance, self )
  self.__index = self

  instance.funcion = funcion
  instance.handler = handler or default_handler

  return instance
end

function ErrorHandler:start( params )
  local status, result = pcall( self.funcion, params )

  self.status = status
  self.result = result

  return self
end

function ErrorHandler:expect( mensaje )
  if self.status then
    return self.result
  end

  self.handler( mensaje, self.result )
end

local maybe = {}

function maybe.init( funcion, handler )
  local err = ErrorHandler:new( funcion, handler )
  return err
end

return maybe
