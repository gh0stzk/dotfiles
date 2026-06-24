local excluded = {
	"node_modules/",
	".local/",
	".cache/",
	"package-lock.json",
	"pnpm-lock.yaml",
	"yarn.lock",
}

return {

	plugin = {
		src = "https://github.com/folke/snacks.nvim",
	},

	config = function()
		require("snacks").setup({
			indent = {
				animate = {
					enabled = vim.fn.has("nvim-0.10") == 1,
					style = "out",
					easing = "linear",
					duration = {
						step = 20,
						total = 500,
					},
				},
			},

			dashboard = {
				width = 70,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 0 },
					--{ section = "startup" },
					--{
					--    section = "terminal",
					--    cmd = "colorscript -e zfetch; sleep .1",
					--    pane = 2,
					--    indent = 2,
					--    height = 20,
					--},
				},
			},

			picker = {
				sources = {
					explorer = {
						auto_close = false,
						hidden = true,
						ignored = true,
						layout = {
							layout = { position = "left" },
						},
					},
					files = {
						hidden = true,
						ignored = true,
						exclude = excluded,
					},
				},
				hidden = true,
				ignored = true,
			},

			scroll = {},
		})

		local snacks = require("snacks")
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				desc = desc,
				silent = true,
			})
		end

		-- Buscadores principales y Explorador de Archivos
		map("n", "<leader><space>", function()
			snacks.picker.smart()
		end, "Smart Find Files")

		map("n", "<leader>,", function()
			snacks.picker.buffers()
		end, "Buffers")

		map("n", "<leader>/", function()
			snacks.picker.grep()
		end, "Grep")

		map("n", "<leader>:", function()
			snacks.picker.command_history()
		end, "Command History")

		map("n", "<leader>e", function()
			snacks.explorer()
		end, "File Explorer")

		-- Atajos de búsqueda (Find)
		map("n", "<leader>fb", function()
			snacks.picker.buffers()
		end, "Buffers")

		map("n", "<leader>fc", function()
			snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end, "Find Config File")

		map("n", "<leader>ff", function()
			snacks.picker.files()
		end, "Find Files")

		map("n", "<leader>fg", function()
			snacks.picker.git_files()
		end, "Find Git Files")

		map("n", "<leader>fp", function()
			snacks.picker.projects()
		end, "Projects")

		map("n", "<leader>fr", function()
			snacks.picker.recent()
		end, "Recent")

		-- Atajos de Git
		map("n", "<leader>gb", function()
			snacks.picker.git_branches()
		end, "Git Branches")

		map("n", "<leader>gl", function()
			snacks.picker.git_log()
		end, "Git Log")

		map("n", "<leader>gL", function()
			snacks.picker.git_log_line()
		end, "Git Log Line")

		map("n", "<leader>gs", function()
			snacks.picker.git_status()
		end, "Git Status")

		map("n", "<leader>gS", function()
			snacks.picker.git_stash()
		end, "Git Stash")

		map("n", "<leader>gd", function()
			snacks.picker.git_diff()
		end, "Git Diff (Hunks)")

		-- Atajos de LSP (Definiciones, Referencias y Símbolos)
		map("n", "gd", function()
			snacks.picker.lsp_definitions()
		end, "Goto Definition")

		map("n", "gD", function()
			snacks.picker.lsp_declarations()
		end, "Goto Declaration")

		map("n", "gr", function()
			snacks.picker.lsp_references()
		end, "References")

		map("n", "gI", function()
			snacks.picker.lsp_implementations()
		end, "Goto Implementation")

		map("n", "gy", function()
			snacks.picker.lsp_type_definitions()
		end, "Goto T[y]pe Definition")

		map("n", "<leader>ss", function()
			snacks.picker.lsp_symbols()
		end, "LSP Symbols")

		map("n", "<leader>sS", function()
			snacks.picker.lsp_workspace_symbols()
		end, "LSP Workspace Symbols")
	end,
}
