
-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv-gv', { noremap = true, silent = true, desc = "Move Up"})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv-gv', { noremap = true, silent = true, desc = "Move Up"})

vim.api.nvim_set_keymap('n', '<A-l>', 'xp', { noremap = true, silent = true, desc = "Move Left"})
vim.api.nvim_set_keymap('v', '<A-l>', 'xp', { noremap = true, silent = true, desc = "Move Left"})
vim.api.nvim_set_keymap('n', '<A-h>', 'xhP', { noremap = true, silent = true, desc = "Move Right"})
vim.api.nvim_set_keymap('v', '<A-h>', 'xhP', { noremap = true, silent = true, desc = "Move Right"})

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true, desc = "Save"})
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current window'})
vim.api.nvim_set_keymap('n', '<leader>C', ':bd!<CR>', { noremap = true, silent = true, desc = 'Close current window without saving'})
vim.api.nvim_set_keymap('n', '<leader>q', ':confirm q<CR>', { noremap = true, silent = true, desc = "Quit"})
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true, desc = "No Highlight"})

vim.api.nvim_set_keymap('n', '<leader>bb', ':bp<CR>', { noremap = true, silent = true, desc = "Buffer Back"})
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true, desc = "Buffer Next"})


vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', {noremap = true, silent = true })

-- Reload
vim.api.nvim_set_keymap('n', '<leader>lr', ':e <CR>', { noremap = true, silent = true, desc = "Reload File"})

-- next diagnostic
vim.keymap.set('n', '<leader>le', function()
    local next = vim.diagnostic.get_next({
      wrap = false,
      count = -1,
      severity = {
        vim.diagnostic.severity.WARN,
        vim.diagnostic.severity.ERROR,
      }
    })
    if next then
      vim.diagnostic.jump({ diagnostic = next })
    else
      vim.diagnostic.jump({
        count = -1,
        severity = {
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.ERROR,
        },
      })
    end
  end)


-- harpoon
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set('n', '<leader>mm', function() harpoon:list():add() end, 		{desc="Mark"})
vim.keymap.set('n', '<leader>mt', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc="Quick Menu"})
vim.keymap.set('n', '<leader>ma', function() harpoon:list():select(1) end, 	{desc="Select 1."})
vim.keymap.set('n', '<leader>ms', function() harpoon:list():select(2) end, 	{desc="Select 2."})
vim.keymap.set('n', '<leader>md', function() harpoon:list():select(3) end, 	{desc="Select 3."})
vim.keymap.set('n', '<leader>mf', function() harpoon:list():select(4) end, 	{desc="Select 4."})
vim.keymap.set('n', '<leader>mn', function() harpoon:list():prev() end, 	{desc="Select Next"})
vim.keymap.set('n', '<leader>mb', function() harpoon:list():next() end, 	{desc="Select Prev"})


vim.keymap.set('n', '<leader>fm', ':set foldmethod=manual<CR>', {desc="fold manually"})
vim.keymap.set('n', '<leader>fe', ':set foldmethod=expr<CR>', {desc="fold with TS"})

local fidget = require("fidget")

vim.keymap.set("n", "<leader>x", function()
  fidget.notify("This is from fidget.notify().")
end)


vim.keymap.set('n', '<leader>P', ":mks!<CR>", 	{desc="Save Session"})
vim.keymap.set('n', '<leader>p', ":source Session.vim<CR>", 	{desc="Open last Session"})
