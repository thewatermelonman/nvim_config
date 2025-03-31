require("telescope").load_extension("emoji")
require("telescope").setup({
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	},
    extensions = {
        emoji = {
            action = function(emoji)
                -- argument emoji is a table.
                -- {name="", value="", cagegory="", description=""}

                vim.fn.setreg("*", emoji.value)
                print([[Press p or "*p to paste this emoji]] .. emoji.value)

                -- insert emoji when picked
                vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
        }
    },
})

