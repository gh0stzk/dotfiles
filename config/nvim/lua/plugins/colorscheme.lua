return {

	plugin = {
		src = "https://github.com/nvim-mini/mini.base16",
	},

	config = function()
		require("theme").reload()
	end,
}
