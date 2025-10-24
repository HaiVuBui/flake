return {
 -- {  
 --   -- Catppuchin theme
 --   "catppuccin/nvim",
 --   name = "catppuccin",
 --   priority = 1000,
 --   config = function()
 --     require("catppuccin").setup({
 --       -- flavour = "latte",
 --       -- flavour = "macchiato",
 --       -- flavour = "mocha",
 --       -- flavour = "frappe",
 --     })
 --     vim.cmd.colorscheme "catppuccin"
 --   end,
 -- }, 
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     require("gruvbox").setup()
  --     vim.cmd.colorscheme "gruvbox"
  --   end
  -- }
    {
    "sainnhe/gruvbox-material",
    priority = 1000, -- ensure it loads first
    config = function()
      -- must be set BEFORE colorscheme
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "soft"   -- 'hard' | 'medium' | 'soft'
      -- optional tweaks:
      -- vim.g.gruvbox_material_foreground = "mix"  -- 'material' | 'mix' | 'original'
      -- vim.g.gruvbox_material_enable_italic = 1
      -- vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
