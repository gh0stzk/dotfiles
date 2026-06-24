return {

	plugin = {
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("nvim-treesitter").install({
			"lua",
			"python",
			"html",
			"css",
			"bash",
			"vimdoc",
			"vim",
			"regex",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
	vim.cmd("syntax off"),
}
