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
