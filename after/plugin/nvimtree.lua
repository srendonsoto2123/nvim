local status_nvimtree, nvim_tree = pcall(require, "nvim-tree")

if not status_nvimtree then
  vim.notify(nvim_tree, "error", {
      title = "Nvim-tree",
   })
   return
end

nvim_tree.setup()
