vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- vim.cmd('colorscheme melange')

vim.lsp.enable({
    'zls',
    'lua_ls',
    'clangd',
	'astro',
})

vim.diagnostic.config({
	virtual_text = true,  -- show inline messages
	signs = true,         -- show signs in the gutter
	underline = true,     -- underline problematic text
	update_in_insert = false, -- don't update diagnostics while typing
	severity_sort = true,     -- sort diagnostics by severity
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require('mini.indentscope').gen_animation.none()
