vim.cmd( "colorscheme tokyonight" )

local state_nightfox, nightfox = pcall( require, "nightfox" )

if not state_nightfox then
   return
end

nightfox.setup({
   options = {
      transparent = false
   }
})

vim.cmd( "colorscheme nightfox" )
