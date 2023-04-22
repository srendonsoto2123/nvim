return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
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
  },
  config = function(_, opts)
    require'nvim-treesitter.configs'.setup(opts)
  end,
  build = ":TSUpdate",
}
