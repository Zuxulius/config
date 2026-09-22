-- lualine with a flat, single-colour bar that changes colour per mode, matching the
-- VSCode vim extension's "vim.statusBarColors.*" settings.
local function bar(bg, fg)
  local seg = { bg = bg, fg = fg }
  return {
    a = { bg = bg, fg = fg, gui = "bold" },
    b = seg,
    c = seg,
    x = seg,
    y = seg,
    z = seg,
  }
end

local white = "#ffffff"
local vscode_statusbar = {
  normal = bar("#2e4045", white),
  insert = bar("#5e3c58", white),
  visual = bar("#83adb5", white),
  replace = bar("#2e4045", white),
  command = bar("#2C2206", white),
  terminal = bar("#2e4045", white),
  -- Frappé mantle / subtext0 for windows that don't have focus.
  inactive = bar("#292c3c", "#a5adce"),
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = vscode_statusbar,
      component_separators = "",
      section_separators = "",
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
