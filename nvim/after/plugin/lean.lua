vim.g.lean_config = { -- see the manual for full configuration options
  mappings = true,
}
vim.diagnostic.config{ update_in_insert = true }
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lean",
  callback = function(event)
    vim.keymap.set("n", "<leader>pl", ":Telescope loogle<CR>", { buffer = event.buf })
  end,
})
