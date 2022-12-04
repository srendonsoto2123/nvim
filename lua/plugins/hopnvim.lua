local status_hop, hopnvim = pcall(require,"hop")

if not status_hop then
  vim.notify(hopnvim, "error", {
    title = "hop",
  })
  return
end

hopnvim.setup {
  keys = 'asdfghjklñqwertyuiopzxcvbnm,.-',
}

require("mapping")"hop"
