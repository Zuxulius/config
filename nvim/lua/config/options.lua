local opt = vim.opt

vim.opt.showmode = false -- Lualine handles this
opt.cmdheight = 0 -- Command line only appears when typing ":" or "/", so lualine sits on the last row
opt.timeoutlen = 300

-- Match VS Code's cursor margin and native mode shapes.
opt.scrolloff = 5

-- Terminal cursors cannot reproduce VS Code's outlined Visual cursor or smooth animation.
-- Use a block in Visual mode and enable blinking in all modes instead.
opt.guicursor = {
  "n-v-ve-c-sm:block",
  "i-ci:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait500-blinkon500-blinkoff500",
}

opt.number = true -- Line numbers
opt.relativenumber = false -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.wrap = true -- Wrap lines
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.mousescroll = "ver:1,hor:6" -- One line per wheel tick (default 3), closer to VSCode
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Indentation
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.hlsearch = false -- Don't highlight search results
opt.incsearch = true -- Show matches as you type
