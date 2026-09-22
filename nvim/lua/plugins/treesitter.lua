-- Treesitter drives most of Catppuccin's syntax colours. Without it TypeScript/TSX
-- fall back to Vim's regex syntax and look nothing like VSCode.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "css",
        "diff",
        "dockerfile",
        "gitcommit",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        -- Regex syntax on top of treesitter double-colours markdown; leave it off.
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
