local mapping = require("utils.mapping")
local map_cr = mapping.map_cr

local mapeos = {
   maps = {
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
   },
   setLspMaps = function( bufnr )
      local fn = "lua vim.lsp.buf."
      return {
          map_cr( "n", "gD", fn .. "declaration()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "gd", fn .. "definition()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "K", fn .. "hover()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "gi", fn .. "implementation()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>h", fn .. "signature_help()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>aw", fn .. "add_workspace_folder()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>rw", fn .. "remove_workwpace_folder()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>lw", "lua print(vim.inspect( vim.lsp.buf.list_workspace_folders() ))" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>D", fn .. "type_definition()" ):set_buffer( bufnr ):with_silent():with_noremap(),
          map_cr( "n", "<Leader><Leader>rn", fn .. "rename()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>ca", fn .. "code_action()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "gr", fn .. "references()" ):set_buffer( bufnr ):with_noremap():with_silent(),
          map_cr( "n", "<Leader><Leader>f", fn .. "formatting()" ):set_buffer( bufnr ):with_noremap():with_silent(),
      }
   end
}

return mapeos;
