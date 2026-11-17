vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99 
-- vim.o.foldnestmax = 1
vim.o.foldenable = true
vim.opt.fillchars = { fold = " ", }

function _G.MyFoldText()
  local line = vim.fn.getline(vim.v.foldstart):gsub("^%s*", "")
  local count = vim.v.foldend - vim.v.foldstart + 1
  local indent = string.rep(" ", vim.o.shiftwidth * (#vim.v.folddashes-1))
  return string.format("%s%s +%s (%d lines)", indent, line, vim.v.folddashes, count)
end
vim.o.foldtext = "v:lua.MyFoldText()"

vim.keymap.set('n', '<leader>o', 'za');
vim.keymap.set('n', 'zo', 'za');
