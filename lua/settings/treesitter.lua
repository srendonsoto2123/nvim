require("nvim-treesitter.configs").setup {
  ensure_installed = { "rust", "go", "lua", "c_sharp", "dockerfile", "python", "solidity", "yaml" },

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
