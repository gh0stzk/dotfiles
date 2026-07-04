return {

	plugin = {
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("nvim-treesitter").install({
			"lua",
			"python",
			"bash",
			"vimdoc",
			"vim",
			"regex",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft
				local ts_config = require("nvim-treesitter.config")

				if vim.tbl_contains(ts_config.get_installed(), lang) then
					pcall(vim.treesitter.start, args.buf)
					return
				end

				if not vim.tbl_contains(ts_config.get_available(), lang) then
					return
				end

				local notify = vim.notify
				vim.notify = function() end
				require("nvim-treesitter").install({ lang }, { summary = false })
				vim.notify = notify

				local timer = vim.uv.new_timer()
				timer:start(
					500,
					500,
					vim.schedule_wrap(function()
						if vim.tbl_contains(require("nvim-treesitter.config").get_installed(), lang) then
							timer:stop()
							timer:close()
							if vim.api.nvim_buf_is_valid(args.buf) then
								pcall(vim.treesitter.start, args.buf)
							end
						end
					end)
				)
			end,
		})
	end,
}
