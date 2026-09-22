-- Splits
vim.keymap.set("n", "<leader>s", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split window vertically" })

-- Move between splits: <leader>w + direction
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })

-- Buffers (tabs): <leader>h / <leader>l and <leader>1-9 live in plugins/bufferline.lua

-- Faster movement
vim.keymap.set({ "n", "x" }, "<C-j>", "5j", { desc = "Jump 5 lines down" })
vim.keymap.set({ "n", "x" }, "<C-k>", "5k", { desc = "Jump 5 lines up" })
vim.keymap.set({ "n", "x" }, "<C-h>", "5h", { desc = "Jump 5 columns left" })
vim.keymap.set({ "n", "x" }, "<C-l>", "5l", { desc = "Jump 5 columns right" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Diagnostics: inline text gets clipped at the window edge, so these show the whole thing.
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show full diagnostic under cursor" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action (VSCode Cmd+.)" })
