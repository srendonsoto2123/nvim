local mapping = require("utils.mapping")

local map_cr = mapping.map_cr
-- local map_cmd = mapping.map_cmd
-- local map_cu = mapping.map_cu

-- map_g({ mode = "n", key = "<Leader>nt", rhs = ":NERDTreeFind<CR>" })
-- map_g({ mode = "n", key = "<Leader>s", rhs = "<Plug>(easymotion-s2)", opts = { silent = true } })
-- map_g({ mode = "n", key = "<Leader>w", rhs = ":w<CR>" })
-- map_g({ mode = "n", key = "<Leader>W", rhs = ":wa<CR>" })
-- map_g({ mode = "n", key = "<Leader>q", rhs = ":q<CR>" })
-- map_g({ mode = "n", key = "<Leader>Q", rhs = ":qa<CR>" })
-- map_g({ mode = "n", key = "<Leader>S", rhs = ":wqa<CR>" })
-- map_g({ mode = "n", key = "<Leader>hl", rhs = ":nohlsearch<CR>" })
-- map_g({ mode = "n", key = "<Leader>vs", rhs = ":vs" })
-- map_g({ mode = "n", key = "<Leader>hs", rhs = ":sp" })

local maps = {
  -- NERDTREE MAPS
  map_cr( "n", "<Leader>nt", "NERDTreeFind" ):with_noremap(),
  map_cr( "v", "<Leader>nt", "NERDTreeFind" ):with_noremap(),

  -- USER MAPS
  map_cr( "n", "<Leader>w", "w" ):with_noremap(),
  map_cr( "n", "<Leader>W", "wa" ):with_noremap(),
  map_cr( "n", "<Leader>q", "q" ):with_noremap(),
  map_cr( "n", "<Leader>Q", "qa" ):with_noremap(),
  map_cr( "n", "<Leader>S", "wqa" ):with_noremap(),
  map_cr( "n", "<Leader>hl", "nohlsearch" ):with_noremap(),

  -- LSP MAPPING
  map_cr( "n", "<Leader>ofd", "lua vim.diagnostic.open_float()" ):with_noremap(),
  map_cr( "n", "g{", "lua vim.diagnostic.goto_prev()" ):with_noremap(),
  map_cr( "n", "g}", "lua vim.diagnostic.goto_next()" ):with_noremap(),
  map_cr( "n", "<Leader>ll", "lua vim.diagnostic.setloclist()" ):with_noremap(),

  -- TELESCOPE
  map_cr( "n", "<Leader>tf", "lua require('telescope.builtin').find_files()" ),
  map_cr( "n", "<Leader>tg", "lua require('telescope.builtin').live_grep()" ),
  map_cr( "n", "<Leader>tb", "lua require('telescope.builtin').buffers()" ),
  map_cr( "n", "<Leader>th", "lua require('telescope.builtin').help_tags()" ),

  -- MOTION MAPS
  map_cr( "n", "<Leader><C-j>", "HopChar2AC" ):with_noremap():with_silent(),
  map_cr( "n", "<Leader><C-k>", "HopChar2BC" ):with_noremap():with_silent(),
  map_cr( "v", "<Leader><C-j>", "HopChar2AC" ):with_noremap():with_silent(),
  map_cr( "v", "<Leader><C-k>", "HopChar2BC" ):with_noremap():with_silent(),
  map_cr( "n", "<Leader><C-d>", "HopLineStartAC" ):with_noremap():with_silent(),
  map_cr( "n", "<Leader><C-u>", "HopLineStartBC" ):with_noremap():with_silent(),
  map_cr( "v", "<Leader><C-d>", "HopLineStartAC" ):with_noremap():with_silent(),
  map_cr( "v", "<Leader><C-u>", "HopLineStartBC" ):with_noremap():with_silent(),
}

mapping.set_maps( maps )
