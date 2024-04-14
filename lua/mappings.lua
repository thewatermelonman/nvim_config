-- Keymaps
vim.keymap.set("n", "<leader>/", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true, desc = "Comment Line" })

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true, desc = 'Toggle Explorer'})
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save"})
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current window'})
vim.api.nvim_set_keymap('n', '<leader>q', ':confirm q<CR>', { noremap = true, silent = true, desc = "Quit"})
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true, desc = "No Highlight"})
vim.api.nvim_set_keymap('t', '<leader>t', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], { noremap = true, silent = true, desc = "ToggleTerm"})
vim.api.nvim_set_keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true, silent = true, desc = "Change Window"})

-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv-gv', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv-gv', { noremap = true, silent = true, desc = "Move Up"})

require('which-key').register({
	["t"] = { "<cmd>ToggleTerm<CR> <C-\\><C-n>i", "Terminal" },
	b = {
		name = "Buffers",
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
		b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
		n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
	}
}, { prefix = "<leader>" })



vim.keymap.set('n', '<space>E', vim.diagnostic.open_float, {desc = "See Diagnostic"})
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<rename>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	end,
})
