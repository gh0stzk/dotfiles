return {
	"echasnovski/mini.hipatterns",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = function()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
	end,
}
