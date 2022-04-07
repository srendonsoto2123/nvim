local cmp = require("cmp")
local lspkind = require("lspkind")
lspkind.init()

cmp.setup({
  -- Snippet configuraciones
  snippet = {
    expand = function( args )
      require"snippy".expand_snippet(args.body)
    end,
  },

  -- Mapeos para el cmp
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Origenes para obtener la información
  sources = {
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "path" },
    { name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
    },
      keyword_length = 3,
    }
  },

  -- Forma de presentar el menu
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = "[Lsp]",
        buffer = "[Buff]",
        path = "[Path]",
        snippy = "[Snip]"
      }
    }
  },

  -- Elementos experimentales para añadir al cmd
  experimental = {
    ghost_text = true,
  },

  view = {
    entries = "native"
  }
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" },
  })
})

cmp.setup.cmdline("/", {
  sources = {
    {
      name = "buffer",
      keyword_length = 3,
      max_item_count = 8,
    },
  }
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources(
  {
    {
      name = "path",
      keyword_length = 5
    }
  }, {
    {
      name = "cmdline",
      keyword_length = 3,
      max_item_count = 5,
    }
  })
})
