return {
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
      config = function()
        vim.diagnostic.config({
          virtual_text = true,
          severity_sort = true,
          -- Full message in a popup; ]d / [d open it automatically after jumping.
          float = { border = "rounded", source = true, header = "", prefix = "" },
          jump = { float = true },
        })

        vim.lsp.config("lua_ls", {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
              },
            },
          },
        })

        require("mason-lspconfig").setup({
          ensure_installed = {
            "lua_ls",
            "ts_ls",
            "cssls",
            "html",
          },
        })
      end,
    },
  }
