return {
	plugin = {
		src = "https://github.com/stevearc/conform.nvim",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "beautysh" },
				sh = { "beautysh" },
				css = { "prettier" },
				markdown = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		local conform = require("conform")
		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({ async = true })
		end, { desc = "Format buffer (conform)" })
	end,
}
