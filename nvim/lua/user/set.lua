vim.opt.relativenumber = true
vim.opt.number = true
-- vim.opt.paste = true

vim.opt.formatoptions:remove({ "r", "o" })

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.hpp", "*.h", "*.cpp", "*.sh", "*.c" },
  command = "normal! gg=G",
})

vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. ".vim/undodir"

vim.opt.signcolumn = "yes:1"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "
