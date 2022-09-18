local status_feline, feline = pcall(require, "feline")

if not status_feline then
  vim.notify(feline, {
    title = "feline.nvim"
  })
  return
end

local components = {
  active = {
    {}, {}, {},
  },
  inactive = {
    {}, {}, {},
  },
}

table.insert(components.active[1], {
-- Información del componente
  provider = 'position'
})

require("feline").setup()
