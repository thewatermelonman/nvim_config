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
-- nvim-java/nvim-java
-- vidocqh/data-viewer
-- plenary
-- makeit
-- overseer
-- neogen
-- neogit
-- telekasten
-- cmake-tools
-- treesitter
-- rust-tools
-- telescope:
--  "xiyaowong/telescope-emoji.nvim"
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
    {'nvim-java/nvim-java'},
    {
        'vidocqh/data-viewer.nvim',
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kkharji/sqlite.lua", -- Optional, sqlite support
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
	{ "nvim-lua/plenary.nvim" },
	{ -- makeit
		"Zeioth/makeit.nvim",
		cmd = {"MakeitOpen", "MakeitToggleResults", "MakeitRedo", "MakeitStop"},
		dependencies = { "stevearc/overseer.nvim" },
		opts = {
		},
	},
    {
        "github/copilot.vim"
    },
    { 
        "danymat/neogen", 
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*" 
    },
	{ --overseer
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		cmd = {"MakeitOpen", "MakeitToggleResults", "MakeitRedo"},
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 10,
				max_height = 10,
				default_detail = 1
			},
		},
	},
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim",},
    },
	{--cmake
		'Civitasv/cmake-tools.nvim' 
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},
    -- {
    --     "OXY2DEV/markview.nvim",
    --     lazy = false
    -- },
	{
		'simrat39/rust-tools.nvim',
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{ "xiyaowong/telescope-emoji.nvim" },
    { "neovim/nvim-lspconfig" },
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
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "hrsh7th/cmp-cmdline", lazy = true, },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
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
		--config = function() require('leap') end
	},
	{ 'nvim-tree/nvim-web-devicons', },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
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
        'mhartington/oceanic-next'
    },
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("lackluster")
            -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
            -- vim.cmd.colorscheme("lackluster-mint")
        end,
    },
	{
		"savq/melange-nvim" 
	},
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
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
		    vim.g.zenbones_darken_comments = 45
		    vim.cmd.colorscheme('zenbones')
		end
	},
	-- {
	-- 	"RRethy/base16-nvim",
	-- 	config = function() require('base16-colorscheme').setup() end,
	-- },
	{
		"Abstract-IDE/Abstract-cs"
	},
	{
		'ThePrimeagen/vim-be-good',
	},
})

require("config")
