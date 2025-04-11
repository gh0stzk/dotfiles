local excluded = {
	"node_modules/",
	".local/",
	".cache/",

	"package-lock.json",
	"pnpm-lock.yaml",
	"yarn.lock",
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {

		animate = {},

		indent = {
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "linear",
				duration = {
					step = 20, -- ms per step
					total = 500, -- maximum duration
				},
			},
		},

		dashboard = {
			-- width = 65,
			-- sections = {
			-- { section = "header" },
			-- { section = "keys", gap = 1, padding = 1 },
			-- { section = "startup" },
			-- {
			-- section = "terminal",
			-- cmd = "colorscript -e zfetch; sleep .1",
			-- pane = 2,
			-- indent = 2,
			-- height = 20,
			-- },
			-- },
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
	},

	keys = {
    		-- Top Pickers & Explorer
    		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    		{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    		-- find
    		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    		{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    		-- git
   		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    		{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    		{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
		-- LSP
    		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    		{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    		{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    		{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  	},

}
