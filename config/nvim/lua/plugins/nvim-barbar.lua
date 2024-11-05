return {
	"romgrk/barbar.nvim",

	config = function()
		require("barbar").setup({
			animation = false,
            auto_hide = 0,
			sidebar_filetypes = {
				NvimTree = true,
				["neo-tree"] = { event = "BufWipeout" },
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
