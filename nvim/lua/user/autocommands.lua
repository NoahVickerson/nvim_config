vim.api.nvim_create_autocmd( "TextYankPost", {
  desc = "Highlight effect for yanked text",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
  end,
})

-- vim.api.nvim_create_autocmd( "FileType", {
--   desc = "Highlight effect for yanked text",
--   pattern = "nvim-undotree",
--   callback = function()
--     vim.wincmd("H")
--     vim.api.nvim_win_set_width(0, 40)
--   end,
-- })

-- Sessions
function file_exists_in_cwd(file)
   local ok, err, code = os.rename("./" .. file, "./" .. file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

local function refresh_buffers()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) then
            vim.api.nvim_buf_call(bufnr, function()
                vim.cmd('filetype detect')
            end)
        end
    end
end

vim.api.nvim_create_autocmd( "VimEnter", {
  desc = "Restart current session",
  callback = function()
    if file_exists_in_cwd("session.vim") then
      vim.cmd("source ./session.vim")
      refresh_buffers()
    end
  end,
})

vim.api.nvim_create_autocmd( "ExitPre", {
  desc = "Save current session",
  callback = function()
    if file_exists_in_cwd("session.vim") then
      vim.cmd("mksession! ./session.vim")
    end
  end,
})
