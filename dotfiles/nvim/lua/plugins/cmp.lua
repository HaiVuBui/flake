-- ~/.config/nvim/lua/plugins/cmp.lua

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- Key mappings for the completion menu
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp.SelectBehavior.Insert),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp.SelectBehavior.Insert),
      }),
      -- The sources nvim-cmp will draw suggestions from, in order of priority
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "codeium" }, -- The name for the Windsurf source
        { name = "luasnip" },
        { name = "buffer" },
      }),
    })
  end,
}

