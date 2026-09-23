-- Sticky scroll, VSCode "editor.stickyScroll.enabled": the lines that open the scopes
-- around the top of the viewport stay pinned at the top of the window.
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    enable = true,
    -- VSCode decides the pinned scopes from the top of the viewport, not the cursor.
    mode = "topline",
    -- VSCode default "editor.stickyScroll.maxLineCount" is 5.
    max_lines = 5,
    -- Show only the first line of a multi-line scope opener.
    multiline_threshold = 1,
    trim_scope = "outer",
    separator = nil,
  },
}
