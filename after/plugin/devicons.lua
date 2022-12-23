local stauts_icons, devicons = pcall(require, "nvim-web-devicons")

if not stauts_icons then
  vim.notify(devicons, "error", {
    title = "Devicons"
  })
  return
end

devicons.setup {
  default = true
}
