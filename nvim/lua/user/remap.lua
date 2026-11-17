vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({ 'n' , 'v' }, 'y', '"+y', { noremap = true })
vim.keymap.set({ 'n' , 'v' }, 'Y', 'y', { noremap = true })

vim.keymap.set({ "i", "x" }, "<C-s>", "<Esc>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- terminal accesss keymaps
vim.keymap.set("n", "<leader>c", ":!<Up><Enter>")
vim.keymap.set("n", "<leader>r", "<C-w>l<C-w>ji<Up><CR>")
vim.keymap.set("n", "<leader>t", "<C-w>l<C-w>ji")

-- cpp and MATLAB disp keymap
vim.keymap.set({"n"}, "<leader>d", "yiWodisp(<Esc>pA);<Esc>");

-- Move visual selection up/down
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) 
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Vs", "vs", {})

-- Terminal remaps
vim.api.nvim_create_user_command("Term", "belowright split | terminal", {})
vim.keymap.set("n", "<C-w>T", ":vs<CR><C-w>l:term<CR>i", {})
vim.keymap.set("n", "<C-w>t", ":vs<CR><C-w>l:term<CR>i", {})
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", {})
vim.keymap.set("t", "<C-s>", "<C-\\><C-n>", {})
