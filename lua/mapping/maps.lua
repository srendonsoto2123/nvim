local mapping = require("utils.mapping")
local map_cr = mapping.map_cr
local map_cmd = mapping.map_cmd

local telescope_builtin = "lua require('telescope.builtin')."
local dap = "lua require('dap')."

local maps = {
  -- USER MAPS
  user = {
    map_cr({ "n", "v" }, "<Leader>w", "w"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>W", "wa"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>q", "q"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>Q", "qa"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>S", "wqa"):with_noremap(),
    map_cr({ "n", "v" }, "<M-z>", "set wrap!"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>,", "bp"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>.", "bn"):with_noremap(),
    map_cmd({ "n", "v" }, "<c-j>", "<c-w>j"):with_noremap(),
    map_cmd({ "n", "v" }, "<c-h>", "<c-w>h"):with_noremap(),
    map_cmd({ "n", "v" }, "<c-k>", "<c-w>k"):with_noremap(),
    map_cmd({ "n", "v" }, "<c-l>", "<c-w>l"):with_noremap(),
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
    map_cr("n", "<Leader>tf", telescope_builtin .. "find_files()"),
    map_cr("n", "<Leader>tg", telescope_builtin .. "live_grep()"),
    map_cr("n", "<Leader>tb", telescope_builtin .. "buffers()"),
    map_cr("n", "<Leader>th", telescope_builtin .. "help_tags()"),
    map_cr("n", "<Leader>tc", telescope_builtin .. "commands()"),
    map_cr("n", "<Leader>td", telescope_builtin .. "diagnostics()")
  },

  -- NVIMTREE MAPS
  nvimtree = {
    map_cr({ "n", "v" }, "<Leader>nt", "NvimTreeToggle"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>nf", "NvimTreeFocus"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>nc", "NvimTreeClose"):with_noremap(),
    map_cr({ "n", "v" }, "<Leader>nr", "NvimTreeRefresh"):with_noremap(),
  },

  -- MOTION MAPS
  hop = {
    map_cr({ "n", "v" }, "<Leader>j", "HopChar2AC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>k", "HopChar2BC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>d", "HopLineStartAC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>e", "HopLineStartBC"):with_noremap():with_silent(),
    map_cr({ "n", "v" }, "<Leader>s", "HopPattern"):with_noremap():with_silent(),
  },

  dap = {
    map_cr({ "n", "v" }, "<F8>", dap .. "toggle_breakpoint()"),
    map_cr({ "n", "v" }, "<F9>", dap .. "step_into()"),
    map_cr({ "n", "v" }, "<F10>", dap .. "step_over()"),
    map_cr({ "n", "v" }, "<F5>", dap .. "continue()"),
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
      map_cr("n", "<Leader>lw", "lua print(vim.inspect( vim.lsp.buf.list_workspace_folders() ))"):set_buffer(bufnr)
          :with_noremap():with_silent(),
      map_cr("n", "<Leader>D", fn .. "type_definition()"):set_buffer(bufnr):with_silent():with_noremap(),
      map_cr("n", "<Leader>rn", fn .. "rename()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "<Leader>c", fn .. "code_action()"):set_buffer(bufnr):with_noremap():with_silent(),
      map_cr("n", "gr", fn .. "references()"):set_buffer(bufnr):with_noremap():with_silent(),
    }
  end,
}

return maps;
