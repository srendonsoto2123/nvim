local stauts_icons, devicons = pcall(require, "nvim-web-devicons")

if not stauts_icons then
   return
end

devicons.setup {
  default = true
}
