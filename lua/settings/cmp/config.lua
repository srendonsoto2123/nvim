local config_cmp = {
   snippet = {
      expand = function( args )
         require"snippy".expand_snippet( args.body )
      end,
   },
   sources = {
      nvim_lsp = {
         name = "nvim_lsp",
         max_item_count = 10,
      },
      snippy = {
         name = "snippy",
         max_item_count = 3,
      },
      buffer = {
         name = "buffer",
         keyword_length = 2,
         max_item_count = 3,
         option = {
            get_bufnrs = function()
               return vim.api.nvim_list_bufs()
            end
         },
      },
      cmdline = {
         name = "cmdline",
         keyword_length = 2,
         max_item_count = 5,
      },
      path = {
         name = "path",
         keyword_length = 2,
         max_item_count = 7,
      },
      cmp_git = {
         name = "cmp_git",
      }
   }
}

return config_cmp
