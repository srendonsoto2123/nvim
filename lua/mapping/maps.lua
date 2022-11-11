local mapping = require("utils.mapping")
local map_cr = mapping.map_cr

local maps = {
  -- USER MAPS
  user = {
    map_cr("n", "<Leader>w", "w"):with_noremap(),
    map_cr("n", "<Leader>W", "wa"):with_noremap(),
    map_cr("n", "<Leader>q", "q"):with_noremap(),
    map_cr("n", "<Leader>Q", "qa"):with_noremap(),
    map_cr("n", "<Leader>S", "wqa"):with_noremap(),
    map_cr("n", "<M-z>", "set wrap!"):with_noremap(),
    map_cr("n", "<Leader>,", "bp"):with_noremap():with_silent(),
    map_cr("n", "<Leader>.", "bn"):with_noremap():with_silent(),
    map_cr("n", "<Leader>vab", "vert ba"):with_silent(),
    map_cr("n", "<Leader>tab", "tab ba"):with_silent(),
    map_cr("n", "<Leader>bd", "bd"):with_silent(),
  },

  -- LSP MAPPING
  lsp = {
    map_cr("n", "<Leader>o", "lua vim.diagnostic.open_float()"):with_noremap(),
    map_cr("n", "g{", "lua vim.diagnostic.goto_prev({ border = rounded })"):with_noremap(),
    map_cr("n", "g}", "lua vim.diagnostic.goto_next({ border = rounded })"):with_noremap(),
    map_cr("n", "<Leader>ll", "lua vim.diagnostic.setloclist()"):with_noremap(),
  },

  -- TELESCOPE
  telescope = {
    map_cr("n", "<Leader>tf", "lua require('telescope.builtin').find_files()"),
    map_cr("n", "<Leader>tg", "lua require('telescope.builtin').live_grep()"),
    map_cr("n", "<Leader>tb", "lua require('telescope.builtin').buffers()"),
    map_cr("n", "<Leader>th", "lua require('telescope.builtin').help_tags()"),
  },

  -- NVIMTREE MAPS
  nvimtree = {
    map_cr({"n", "v"}, "<Leader>nt", "NvimTreeToggle"):with_noremap(),
  },

  -- MOTION MAPS
  hop = {
    map_cr({ "n", "v" }, "<Leader>j", "HopChar2AC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>k", "HopChar2BC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>d", "HopLineStartAC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>e", "HopLineStartBC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>s", "HopPattern"):with_noremap():with_silent(),
  },

  setLspMaps = function(bufnr)
    local fn = "lua vim.lsp.buf."
    return {
      map_cr("n", "gD", fn .. "declaration()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "gd", fn .. "definition()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "K", fn .. "hover()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "gi", fn .. "implementation()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>h", fn .. "signature_help()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>aw", fn .. "add_workspace_folder()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>rw", fn .. "remove_workwpace_folder()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>lw", "lua print(vim.inspect( vim.lsp.buf.list_workspace_folders() ))"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>D", fn .. "type_definition()"):set_buffer(bufnr):with_silent():with_noremap(),
      map_cr("n", "<Leader>rn", fn .. "rename()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>c", fn .. "code_action()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "gr", fn .. "references()"):set_buffer(bufnr):with_noremap():with_silent(),
    }
  end,
}

return maps;
