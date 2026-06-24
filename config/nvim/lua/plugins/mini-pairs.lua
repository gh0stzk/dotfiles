return {

	plugin = {
		src = "https://github.com/nvim-mini/mini.pairs",
	},

	config = function()
		require("mini.pairs").setup()
	end,
}
