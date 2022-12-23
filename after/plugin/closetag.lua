local status_closetag, closetag = pcall(require, 'nvim-ts-autotag')

if not status_closetag then
   vim.notify("Ha ocurrido un error de carga\nEl plugin no está instalado", "error", {
      title = "nvim-ts-autotag",
   })
   return
end

closetag.setup()
