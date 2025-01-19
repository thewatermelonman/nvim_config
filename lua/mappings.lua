-- KEYMAPS
-- Comments
vim.keymap.set("n", "<leader>/", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true, desc = "Comment Line" })

-- quick actions
vim.api.nvim_set_keymap('n', '<leader>E', ':Neotree left toggle<CR>', {noremap = true, silent = true, desc = 'Toggle Explorer'})
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree float toggle<CR>', {noremap = true, silent = true, desc = 'Toggle floating Explorer'})
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save"})
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current window'})
vim.api.nvim_set_keymap('n', '<leader>C', ':bd!<CR>', { noremap = true, silent = true, desc = 'Close current window without saving'})
vim.api.nvim_set_keymap('n', '<leader>q', ':confirm q<CR>', { noremap = true, silent = true, desc = "Quit"})
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true, desc = "No Highlight"})
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], { noremap = true, silent = true, desc = "ToggleTerm"})
vim.api.nvim_set_keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true, silent = true, desc = "Change Window"})

-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv-gv', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv-gv', { noremap = true, silent = true, desc = "Move Up"})


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live Grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find Buffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help Tags"})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme ,{desc = "Choose Colorscheme"})
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, {desc = "Next Error"})
vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, {desc = "Prev Error"})

-- leap
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
--vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)') Conflicts with vim-surround

local wk = require("which-key")
wk.add({
	{ "<leader>b", group = "Buffers" },
	{ "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
	{ "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
	{ "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
	{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
	{ "<leader>m", group = "Makeit" },
	{ "<leader>mm", ":MakeitRedo<cr>", desc = "Redo" },
	{ "<leader>mo", ":MakeitOpen<cr>", desc = "Open" },
	{ "<leader>mt", ":MakeitToggleResults<cr>", desc = "Toggle Results" },
	{ "<leader>t", "<cmd>ToggleTerm<CR> <C-\\><C-n>i", desc = "Terminal" },
})

-- LSP
vim.keymap.set('n', '<space>le', vim.diagnostic.open_float, {desc = "See Diagnostic"})
vim.keymap.set('n', '<space>lr', ":LspRestart<cr>", {desc = "Restart Lsp"})
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
