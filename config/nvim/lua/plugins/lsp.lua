return {

	plugin = {
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
		{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
		{ src = "https://github.com/rafamadriz/friendly-snippets" },
	},

	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"shellcheck",
				"stylua",
				"beautysh",
				"prettier",
			},
		})

		require("blink.cmp").setup({
			signature = {
				enabled = true,
				window = { show_documentation = false },
			},
		})
		vim.lsp.enable({ "lua_ls", "bashls" })
	end,
}
