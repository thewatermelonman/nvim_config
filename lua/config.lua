vim.g.mapleader = " "

vim.opt.wrap = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.cmd[[colorscheme ferrum]]

require('plugins.bufferline')
require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.lualine')
require('mappings')
require('lsp.init')


vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
	copy = {
		["*"] = "win32yank.exe -i --crlf",
		["+"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}


