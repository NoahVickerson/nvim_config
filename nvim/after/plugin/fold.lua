vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99 
-- vim.o.foldnestmax = 1
vim.o.foldenable = true
vim.o.foldtext = ""

vim.keymap.set('n', '<leader>o', 'za');
vim.keymap.set('n', 'zo', 'za');
