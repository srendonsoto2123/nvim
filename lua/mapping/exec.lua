local status_telescope, _ = pcall(require, "telescope")
local map = require 'mapping'

if status_telescope then
  map('telescope')
end

local status_nvimtree, _ = pcall(require, "nvim-tree")
if status_nvimtree then
  map('nvimtree')
end

local status_hop, _ = pcall(require, "hop-nvim")
if status_hop then
  map('hop')
end
