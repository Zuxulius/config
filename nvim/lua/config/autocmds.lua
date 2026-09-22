local augroup = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Vim marks a buffer modified based on undo history, not content: add a line and delete
-- it again and it still thinks you have unsaved changes. VSCode compares content with the
-- last save. Do the same: remember a hash of the buffer at read/write time, and after each
-- change clear the modified flag if the buffer is back to that state.
local saved_hash = {}

local function buffer_hash(buf)
  return vim.fn.sha256(table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), "\n"))
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  group = augroup,
  callback = function(args)
    -- ":w othername" writes a copy; the buffer's own saved state is unchanged.
    if vim.fn.fnamemodify(args.file, ":p") ~= vim.api.nvim_buf_get_name(args.buf) then
      return
    end
    saved_hash[args.buf] = buffer_hash(args.buf)
  end,
})

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  group = augroup,
  callback = function(args)
    local saved = saved_hash[args.buf]
    if saved and vim.bo[args.buf].modified and buffer_hash(args.buf) == saved then
      vim.bo[args.buf].modified = false
    end
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  group = augroup,
  callback = function(args)
    saved_hash[args.buf] = nil
  end,
})
