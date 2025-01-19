require('render-markdown').setup({
	file_types = { 'markdown', 'quarto' },
	heading = {
		width = { 'full', 'block', 'block', 'block' },
		left_margin = {0, 0, 2, 4},
		min_width = 30,
		sign = false,
	},
})
