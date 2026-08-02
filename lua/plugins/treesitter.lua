return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
	  ensure_installed = { 'astro', 'html', 'tsx', 'typescript', 'zig'},
	  auto_instal = true,
	  highlight = {
		  enable = true,
	  }
  }
}
