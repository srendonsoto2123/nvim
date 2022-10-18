local status_cmp, cmp = pcall(require, "cmp")

if not status_cmp then
  vim.notify(cmp, "error", {
    title = "Cmp - Autocomplete"
  })
  return
end

local lspkind = require("lspkind")
local config_cmp = require("core.cmp.config")
local recursos = config_cmp.sources
local snippy = require("snippy")

lspkind.init()

cmp.setup({
  -- Snippet configuraciones
  snippet = {
    expand = function( args )
      require"snippy".expand_snippet(args.body)
    end,
  },

  completion = {
     autocomplete = false,
     keyword_length = 2,
  },

  preselect = false,

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
    ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif snippy.can_expand_or_advance() then
            snippy.expand_or_advance()
         else
            fallback()
         end
    end, { "i", "s" }),
    ["<s-Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
          cmp.select_prev_item()
       elseif snippy.can_jump(-1) then
          snippy.previous()
       else
          fallback()
       end
    end, { "i", "s" }),
  },

  -- Origenes para obtener la información
  sources = {
    recursos.nvim_lsp_signature_help,
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

   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
   };
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
   mapping = cmp.mapping.preset.cmdline(),
  sources = {
    recursos.buffer,
  }
})

cmp.setup.cmdline(":", {
   mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
  {
     recursos.path,
  }, {
     recursos.cmdline,
  }),
})
