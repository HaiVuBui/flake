return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'quarto' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('render-markdown').setup({
      enabled = true,
      render_modes = { 'n', 'c', 't' },
      max_file_size = 10.0,
      debounce = 100,
      preset = 'none',
      -- Explicitly enable LaTeX rendering
      latex = {
        enabled = true, -- Enable LaTeX rendering
        converter = { 'latex2text' }, -- Use latex2text for conversion
        highlight = 'RenderMarkdownMath', -- Highlight group for math
      },
      heading = {
        enabled = true,
        sign = true,
        position = 'overlay',
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        width = 'full',
      },
      code = {
        enabled = true,
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = '󰄱 ' },
        checked = { icon = '󰱒 ' },
      },
      anti_conceal = {
        enabled = true,
        ignore = { code_background = true, sign = true },
      },
      log_level = 'error',
    })
  end,
}
