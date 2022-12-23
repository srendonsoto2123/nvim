local status_notify, notify = pcall(require, "notify")

if not status_notify then
  vim.notify(notify, "error", {
    title = "Notify"
  })
  return
end

vim.notify = notify
