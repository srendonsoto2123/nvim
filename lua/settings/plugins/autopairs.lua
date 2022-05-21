local status_autopairs, _ = pcall(require, "jiangmiao/auto-pairs")

if not status_autopairs then
   return
end

vim.g.AutoPairsFlyMode = 1
vim.g.AutoPairsMapCh = 0
vim.g.AutoPairsShortcutToggle = "<M-}>"
