-- Smooth cursor movement, the terminal stand-in for VSCode
-- "editor.cursorSmoothCaretAnimation": "on" and "editor.smoothScrolling".
-- Configured per the README's "smooth cursor without smear": the block keeps its shape
-- and glides to the new position instead of leaving a trail.
return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    stiffness = 0.7,
    trailing_stiffness = 0.7,
    matrix_pixel_threshold = 0.5,
    -- Also animate when the view scrolls (gg, G, /, n, Ctrl-j past the margin).
    scroll_buffer_space = true,
    smear_insert_mode = true,
    -- MesloLGS NF lacks the legacy computing block symbols (they render as a "?" box).
    legacy_computing_symbols_support = false,
  },
}
