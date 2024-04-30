return {
	"nvim-pack/nvim-spectre",
	event = "VeryLazy",
	config = function()
		require("spectre").setup()
	end,
}
