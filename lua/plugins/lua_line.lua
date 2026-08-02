local lsp_section = {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

local ret =  {
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('lualine').setup {
			options = {
				-- theme = '16color'
				disabled_filetypes = { 'packer', 'NvimTree' },
				theme = 'iceberg_dark',
				
				component_separators = '',
				section_separators = '',
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'buffers'},
				lualine_c = {},
				lualine_x = {'filetype', 'branch'},
				lualine_y = {'diagnostics', lsp_section},
				lualine_z = {'progress', 'location'}
			},
		} end,
};

return ret
