return {

	plugin = {
		{ src = "https://github.com/romgrk/barbar.nvim" },
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	},

	config = function()
		require("barbar").setup({
			animation = false,
			auto_hide = 0,
            tabpages = false,
			sidebar_filetypes = {
				NvimTree = true,
				["snacks_layout_box"] = { event = "BufWipeout" },
			},
            icons = {
                filetype = {
                    custom_colors = false,
                    enabled = false,
                },
                separator = {left = '', right = ''},
                separator_at_end = false,
            }
		})
	end,
}
