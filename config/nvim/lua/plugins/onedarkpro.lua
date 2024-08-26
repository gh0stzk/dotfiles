return {
	"olimorris/onedarkpro.nvim",
	name = "onedarkpro",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = {
				transparency = true,
				terminal_colors = true,
				lualine_transparency = true,
			},
			styles = {
				types = "NONE",
				methods = "NONE",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "italic",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
				Normal = "NONE",
				Folded = "NONE",
				SignColumn = "NONE",
				Statusline = "NONE",
				Tabline = "NONE",
			},
		})
		vim.cmd("colorscheme onedark_vivid")
	end,
}
