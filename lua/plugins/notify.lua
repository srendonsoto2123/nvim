local status_notify, notify = pcall(require, "notify")

if not status_notify then
   return
end

vim.notify = notify
