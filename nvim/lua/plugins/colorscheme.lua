-- Catppuccin Frappé, matching VSCode ("workbench.colorTheme": "Catppuccin Frappé").
-- The VSCode extension runs with its defaults (stock palette, bold keywords, italic
-- comments), so no palette overrides here. Old Gruvbox-flavoured config is in
-- ~/.config/nvim/.backup/colorscheme.gruvbox-flavoured.lua.
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      styles = {
        -- VSCode Catppuccin defaults: italicComments = true, boldKeywords = true,
        -- italicKeywords = false.
        comments = { "italic" },
        conditionals = { "bold" },
        loops = { "bold" },
        keywords = { "bold" },
        functions = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        diffview = true,
        gitsigns = true,
        indent_blankline = { enabled = true, scope_color = "lavender", colored_indent_levels = false },
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = { background = true },
        },
        neogit = true,
        nvimtree = true,
        rainbow_delimiters = true,
        render_markdown = true,
        semantic_tokens = true,
        telescope = { enabled = true },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      highlight_overrides = {
        all = function(colors)
          return {
            -- VSCode: "vim.highlightedyank.color": "rgba(250, 189, 47, 0.5)",
            -- "vim.highlightedyank.textColor": "#202020". Terminal highlights have no
            -- alpha, so this is that colour pre-blended over the Frappé base.
            YankHighlight = { bg = "#957a3a", fg = "#202020" },
            -- VSCode: "tab.activeBorder" / "tab.activeBorderTop": "#e68bbe".
            -- Nearest nvim equivalent is the active window's separator.
            WinSeparator = { fg = colors.surface1 },
            CursorLineNr = { fg = colors.lavender, style = { "bold" } },
            NvimTreeNormal = { bg = colors.mantle },
            NvimTreeNormalNC = { bg = colors.mantle },
            NvimTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
          }
        end,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
