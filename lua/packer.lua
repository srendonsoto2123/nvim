-- Archivo para hacer el cambio de vim_plug a packer para hacer uso de los 
-- plugins

local status_packer, packer = pcall(require, "packer")

if not status_packer then
  vim.notify(packer)
  return
end

local setup = function(use)
  use 'wbthomason/packer.nvim'
end

return packer.startup(setup)
