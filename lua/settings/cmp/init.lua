local cmp = require("cmp")
local lspkind = require("lspkind")
local config_cmp = require"settings.cmp.config"
local recursos = config_cmp.sources

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
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
    }),
  },

  -- Origenes para obtener la información
  sources = {
    recursos.nvim_lsp,
    recursos.snippy,
    recursos.buffer,
    recursos.path,
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
})

--cmp.setup.filetype('gitcommit', {
  --sources = cmp.config.sources({
     --recursos.cmd_git,
  --}, {
     --recursos.buffer,
  --})
--})

cmp.setup.cmdline("/", {
  sources = {
    recursos.buffer,
  }
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources(
  {
     recursos.path,
  }, {
     recursos.cmdline,
  }),
})
