return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.o.signcolumn = "yes"

      -- Defaults for all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Basedpyright (Python)
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "basic" },
          },
        },
      })

      -- Haskell Language Server
      vim.lsp.config("hls", {
        filetypes = { "haskell", "lhaskell" },
      })

      -- TexLab (LaTeX)
      vim.lsp.config("texlab", {
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            },
          },
        },
      })

      -- Nixd
      vim.lsp.config("nixd", {})

      -- Enable the servers (no Mason)
      vim.lsp.enable({ "basedpyright", "hls", "texlab", "nixd" })

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
      local cmp = require("cmp")
      cmp.setup {
        sources = { { name = "nvim_lsp" } },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
      }
    end,
  },
}

