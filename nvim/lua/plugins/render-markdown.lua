return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  init = function()
    -- Neovim 0.11 bundles the markdown and markdown_inline parsers, but does
    -- not start treesitter highlighting for markdown on its own.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
