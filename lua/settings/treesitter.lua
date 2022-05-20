require("nvim-treesitter.configs").setup {
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
    additional_vim_regex_highlighting = true,
  },
  indent = {
     enable = false,
  },
}
