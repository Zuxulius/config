-- VSCode: "editor.guides.bracketPairs": true plus default bracketPairColorization.
-- indent-blankline draws the indent guides and highlights the enclosing scope;
-- rainbow-delimiters colours the brackets; the hook below makes the scope guide take
-- the colour of the bracket pair it belongs to, the way VSCode's guide does.
return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("rainbow-delimiters.setup").setup({
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    config = function()
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      require("ibl").setup({
        indent = { char = "│", tab_char = "│" },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
          highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        },
        exclude = {
          filetypes = { "help", "NvimTree", "lazy", "mason", "TelescopePrompt", "markdown" },
        },
      })
    end,
  },
}
