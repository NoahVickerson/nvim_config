
local pick = require("mini.pick")
local builtin = pick.builtin

pick.setup({
    mappings = {
        stop = "<Esc>",

    },
})

-- Find files
vim.keymap.set("n", "<leader>pf", function()
    builtin.files()
end, { desc = "Find files" })

-- List open buffers
vim.keymap.set("n", "<leader>pb", function()
    builtin.buffers()
end, { desc = "List open buffers" })

-- Find git-tracked files
vim.keymap.set("n", "<C-p>", function()
    builtin.files({ tool = "git" })
end, { desc = "Fuzzy find git files" })

-- Grep for a string
vim.keymap.set("n", "<leader>ps", function()
    local search = vim.fn.input("Grep > ")

    if search == "" then
        return
    end

    builtin.grep({
        pattern = search,
        method = "plain",
    })
end, { desc = "Grep string" })


local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)

    return {
        anchor = "NW",
        relative = "editor",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = "rounded",
    }
end

pick.setup({
    mappings = {
        stop = "<Esc>",
    },
    window = {
        config = win_config,
    },
})
