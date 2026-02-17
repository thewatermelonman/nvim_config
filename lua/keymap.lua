
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


