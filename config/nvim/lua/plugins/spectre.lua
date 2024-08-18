return {
	"nvim-pack/nvim-spectre",
	keys = { -- only load the plugin on these keymaps
		{ "<leader-S>", "<CMD>Spectre <CR>" },
	},
	config = function()
		require("spectre").setup()
	end,
}
