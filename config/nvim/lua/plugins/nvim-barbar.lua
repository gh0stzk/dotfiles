return {
	"romgrk/barbar.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("barbar").setup({
			animation = false,
			auto_hide = 0,
			sidebar_filetypes = {
				NvimTree = true,
				["snacks_layout_box"] = { event = "BufWipeout" },
			},
			icons = {
				filetype = {
					custom_icons = false,
				},
				pinned = { button = "", filename = true },
			},
		})
	end,
}
