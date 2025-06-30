vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({ 'n' , 'v' }, 'y', '"+y', { noremap = true })

vim.keymap.set({ "i", "x" }, "<C-s>", "<Esc>")
vim.keymap.set("n", "<C-i>", "jzz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>c", ":!<Up><Enter>")

vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-h>", "<Left>")

-- Move visual selection up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_create_user_command("W", "w", {})

vim.api.nvim_create_user_command("Term", "belowright split | terminal", {})
vim.api.nvim_create_user_command("Matlab", "vs | terminal matlab", {})
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", {})
vim.keymap.set("t", "<C-s>", "<C-\\><C-n>", {})
