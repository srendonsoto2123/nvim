local status_treesitter, treesitter_configs = pcall(require, "nvim-tresitter.configs") 

if not status_treesitter then
   return
end

treesitter_configs.setup {
  ensure_installed = {
     "rust",
     "go",
     "lua",
     "elixir",
     "dockerfile",
     "python",
     "yaml",
     "css",
     "html",
     "javascript",
     "json",
     "toml",
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
