require('user.set')
require("user.remap")
require("user.createProj")
require("user.autocommands")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "neovim/nvim-lspconfig" },
	{ "ThePrimeagen/vim-be-good" },
	{ "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }},
	{ "chentoast/marks.nvim", event = "VeryLazy", opts = {} },
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands=false,
			workspaces = {
				{
					name = "vaults",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/",
					strict=true,
				},
				{
					name = "no-vault",
					path = function()
						-- alternatively use the CWD:
						-- return assert(vim.fn.getcwd())
						return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
					end,
					overrides = {
						notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
						new_notes_location = "current_dir",
						templates = {
							folder = vim.NIL,
						},
						disable_frontmatter = true,
					},
				},
			},
			picker = {
				-- name = "snacks.picker", -- use snacks picker
				name = "telescope.nvim",   -- or telescope
				-- name = "fzf-lua",     -- or fzf-lua
				-- name = "mini.pick",   -- or mini.pick
			},
		}
	},
	{
		'Julian/lean.nvim',
		event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
	}
})

