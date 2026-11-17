-- Install parsers
require("nvim-treesitter").install {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "cpp",
    "bash",
}

-- Enable highlighting
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "cpp",
        "sh",
    },
    callback = function(args)
        if not vim.b[args.buf].treesitter_disabled then
            vim.treesitter.start(args.buf)
        end
    end,
})

-- Disable Treesitter for large files
vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function(args)
        local max_filesize = 200 * 1024

        local ok, stats = pcall(vim.uv.fs_stat, args.file)

        if ok and stats and stats.size > max_filesize then
            vim.b[args.buf].treesitter_disabled = true
            print("Treesitter disabled for large file (>200KB)")
        end
    end,
})
