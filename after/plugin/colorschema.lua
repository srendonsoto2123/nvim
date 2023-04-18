vim.cmd("colorscheme tokyonight-moon")

local state_nightfox, nightfox = pcall( require, "nightfox" )

if not state_nightfox then
   return
end

nightfox.setup({
   options = {
      transparent = false,
      terminal_colors = true,
      style = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      }
   }
})

