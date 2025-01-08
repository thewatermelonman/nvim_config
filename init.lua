-- packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
vim.cmd("packadd packer.nvim")
require("packer").startup(function(use)
    use {"neovim/nvim-lspconfig"}
    -- use {"SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig"}
end)

-- lazy
local lazypath = vim.fn.stdpath("data").. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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


-- Plugins:
-- makeit
-- overseer
-- treesitter
-- mason
-- rust-tools
-- telescope
-- lsp:
-- 	"hrsh7th/nvim-cmp",
-- 	"cmp-nvim-lsp",
--  "cmp_luasnip",
--  "luasnip"
--  "cmp-buffer",
--  "cmp-path",
--  "cmp-cmdline",
--  "coc"
-- nvim-ts-autotag
-- nvim-autopairs
-- Comment
-- which-key
-- leap
-- nvim-web-devicons
-- nvim-tree
-- toggle-term
-- autosave
-- vim-surround
-- bufferline
require("lazy").setup({
	{ -- makeit
		"Zeioth/makeit.nvim",
		cmd = {"MakeitOpen", "MakeitToggleResults", "MakeitRedo"},
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
	},
	{ --overseer
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		cmd = {"MakeitOpen", "MakeitToggleResults", "MakeitRedo"},
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1
			},
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		'simrat39/rust-tools.nvim',
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"cmp-nvim-lsp",
			"cmp_luasnip",
			"cmp-buffer",
			"cmp-path",
			"cmp-cmdline",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{
		"hrsh7th/cmp-cmdline",
		lazy = true,
	},
	{
		'windwp/nvim-ts-autotag',
		config = function() require('nvim-ts-autotag').setup() end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function() require('Comment').setup() end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			require("which-key").setup {
				-- triggers = {"<leader>"}
			}
		end
	},
	{
		'ggandor/leap.nvim',
		config = function() require('leap').create_default_mappings() end,
	},
	{ 'nvim-tree/nvim-web-devicons', },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {
				view = {
					float = {
						enable = true,
					},
				},
			}
		end,
	},
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- config = function() require("oil").setup() end,
	},
	{
		'akinsho/toggleterm.nvim', 
		version = "*", 
		config = true,
	},
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup()
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function() 
			require("bufferline").setup()
		end
	},
	-- UI
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('lualine').setup {
			options = {
				-- theme = '16color'
				disabled_filetypes = { 'packer', 'NvimTree' },
				theme = 'iceberg_dark',
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
		} end,
	},
	-- Colorscemes
	{
		"lunarvim/colorschemes"
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		-- config = function() require'nordic'.load() end
	},
	{
		"lunarvim/colorschemes"
	},
	{
		"Abstract-IDE/Abstract-cs"
	},
	{
		'ThePrimeagen/vim-be-good',
	},
})

require("config")
