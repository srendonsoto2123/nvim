local status_nvimtree, nvimtree = pcall(require, "nvim-tree")

if not status_nvimtree then
  vim.notify("No se ha encontrado el plugin nvim-tree, parece que no ha sido instalado", "error", {
      title = "nvim-tree",
   })
   return
end

nvimtree.setup()

require"mapping""nvimtree"
