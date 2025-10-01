require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "cpp", "bash"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Disable Tree-sitter highlighting for large files
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(args)
    local max_filesize = 200 * 1024 -- 200 KB
    local ok, stats = pcall(vim.loop.fs_stat, args.file)
    if ok and stats and stats.size > max_filesize then
      vim.schedule(function()
        vim.cmd("TSBufDisable highlight")
        vim.cmd("syntax off")
        print("Tree-sitter disabled for large file (>200KB)")
      end)
    end
  end,
})

