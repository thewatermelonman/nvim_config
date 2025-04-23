vim.g.mapleader = " "

vim.opt.wrap = true
vim.opt.breakindent = true 
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.conceallevel=2


vim.cmd('set termguicolors')
vim.cmd('set background=dark')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')

require('plugins.bufferline')
require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.cmake')
require('plugins.markdown')
require('plugins.obsidian')

require('mappings')
require('lsp.init')

--vim.cmd('colorscheme aurora')
--vim.cmd('colorscheme base16-schemer-dark')
--vim.cmd('colorscheme zenburned')
vim.cmd('colorscheme melange')

-- disable Copilot by default
vim.cmd('Copilot disable')

vim.diagnostic.config({ virtual_text = true })

 --[[ vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
]  

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

]]

-- Set a compatible clipboard manager
vim.cmd('set clipboard=unnamedplus')


