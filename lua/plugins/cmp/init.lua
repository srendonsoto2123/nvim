return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind-nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require("lspkind")
      local config_cmp = require("core.cmp.config")
      local recursos = config_cmp.sources
      local snippy = require("snippy")

      cmp.setup({
        snippet = config_cmp.snippet,

        completion = {
          autocomplete = false,
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
          recursos.nvim_lsp,
          recursos.snippy,
          recursos.buffer,
          recursos.path,
          recursos.nvim_lsp_signature_help,
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
    end,
    init = function()
      local cmp = require('cmp')
      local recursos = require('plugins.cmp.config').sources

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          recursos.buffer,
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          recursos.path,
        }, {
          recursos.cmdline,
        }),
      })
    end,
  },
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'onsails/lspkind-nvim',
}
