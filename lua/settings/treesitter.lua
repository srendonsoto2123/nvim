local status_treesitter, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not status_treesitter then
  vim.notify(treesitter_configs)
  return
end

treesitter_configs.setup {
  ensure_installed = {
    "rust",
    "go",
    "lua",
    "c_sharp",
    "dockerfile",
    "python",
    "solidity",
    "yaml",
    "css",
    "html",
    "javascript",
    "json",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "bash",
  },

  sync_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
}
