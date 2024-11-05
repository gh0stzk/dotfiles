return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
			-- terminal_colors = true,
			styles = {
				sidebars = "dark",
				floats = "dark",
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true },
				variables = { italic = true },
			},
		})
		vim.cmd[[colorscheme tokyonight]]
	end,
}
