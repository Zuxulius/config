-- Open buffers shown as a tab strip, like VSCode's editor tabs.
-- Catppuccin supplies the theme; the wrapper adds VSCode's
-- "tab.activeBorder"/"tab.activeBorderTop": "#e68bbe" as an underline on the active tab.
local active_border = "#e68bbe"

local function catppuccin_with_pink_border()
  local theme = require("catppuccin.special.bufferline").get_theme()()
  for name, hl in pairs(theme) do
    if name:match("_selected$") then
      hl.sp = active_border
      hl.underline = true
    end
  end
  return theme
end

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
  event = "VeryLazy",
  keys = {
    { "<leader>l", "<cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<leader>h", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
    -- VSCode Cmd+1..8 jump to that tab, Cmd+9 jumps to the last one.
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Tab 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Tab 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Tab 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Tab 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "Tab 5" },
    { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "Tab 6" },
    { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "Tab 7" },
    { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", desc = "Tab 8" },
    { "<leader>9", "<cmd>BufferLineGoToBuffer -1<CR>", desc = "Last tab" },
    { "<leader>q", "<cmd>bdelete<CR>", desc = "Close tab" },
    { "<leader>Q", "<cmd>BufferLineCloseOthers<CR>", desc = "Close other tabs" },
    { "<leader>tp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin tab" },
    { "<leader>t>", "<cmd>BufferLineMoveNext<CR>", desc = "Move tab right" },
    { "<leader>t<", "<cmd>BufferLineMovePrev<CR>", desc = "Move tab left" },
  },
  opts = function()
    return {
      highlights = catppuccin_with_pink_border,
      options = {
        mode = "buffers",
        -- Show the tab number so <leader>N has a visible target.
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return icon .. count
        end,
        indicator = { style = "underline" },
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
        offsets = {
          { filetype = "NvimTree", text = "Explorer", text_align = "left", separator = true },
        },
      },
    }
  end,
}
