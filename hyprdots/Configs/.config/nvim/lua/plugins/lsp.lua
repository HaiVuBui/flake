return {
-- {
--   "williamboman/mason.nvim",
--   lazy = false,
--   config = function()
--     require("mason").setup()
--   end,
-- },
-- {
--   "williamboman/mason-lspconfig.nvim",
--   dependencies = { "williamboman/mason.nvim" },
--   config = function()
--     require("mason-lspconfig").setup {
--       ensure_installed = { "basedpyright", "hls", "texlab" },
--     }
--   end,
-- },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.o.signcolumn = "yes"

      -- Basedpyright (Python)
      lspconfig.basedpyright.setup {
        capabilities = capabilities,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      }

      -- Haskell Language Server
      lspconfig.hls.setup {
        capabilities = capabilities,
        filetypes = { "haskell", "lhaskell" },
      }

      -- TexLab (LaTeX)
      lspconfig.texlab.setup {
        capabilities = capabilities,
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            },
          },
        },
      }

      -- Keybindings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show hover info" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("cmp").setup {
        sources = {{ name = "nvim_lsp" }},
        mapping = {
          ["<C-Space>"] = require("cmp").mapping.complete(),
          ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
        },
      }
    end,
  },
}
