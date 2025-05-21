return {
--  {  
--    -- Catppuchin theme
--    "catppuccin/nvim",
--    name = "catppuccin",
--    priority = 1000,
--    config = function()
--      require("catppuccin").setup({
--        flavour = "latte",
--      })
--      vim.cmd.colorscheme "catppuccin"
--    end,
--  }, 
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup()
      vim.cmd.colorscheme "gruvbox"
    end
  }
}
