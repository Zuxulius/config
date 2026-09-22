vim.g.mapleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 150 })
    end,
})
