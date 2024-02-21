return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		toggler = {
			line = "gtc",
			block = "gtb",
		},
		opleader = {
			line = "goc",
			block = "gob",
		},
	},
}
