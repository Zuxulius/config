return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- Ensure it loads immediately if you want it available on startup
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optional but highly recommended for file icons
  },
  config = function()
    -- Recommend disabling netrw (built-in file explorer) at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Keep nvim-tree defaults, add vim-style h/l: l opens a file (or expands a folder),
    -- h collapses the folder under the cursor, or jumps to and closes the parent folder
    -- when already on a file.
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      api.config.mappings.default_on_attach(bufnr)
      local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true })
      end
      map("l", api.node.open.edit, "Open")
      map("h", api.node.navigate.parent_close, "Collapse folder")
      map("<CR>", api.node.open.edit, "Open")
    end

    -- Initialize nvim-tree with custom or default configurations
    require("nvim-tree").setup({
      on_attach = on_attach,
      sort = {
        sorter = "case_sensitive",
      },
      update_focused_file = { enable = true },
      view = {
        -- Grow to fit the longest visible name, within bounds.
        width = { min = 30, max = 70, padding = 1 },
      },
      renderer = {
        group_empty = true,
        -- VSCode tree indent is 8px, roughly one character.
        indent_width = 1,
        -- Hover a name that still gets cut off and the full name pops up.
        full_name = true,
      },
      filters = {
        dotfiles = false,
      },
    })

    -- Set keymaps
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", silent = true })
  end,
}
