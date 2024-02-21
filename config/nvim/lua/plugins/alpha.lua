return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Banner
		local banner = {
			"                                                    ",
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                    ",
		}
		dashboard.section.header.val = banner

		-- Menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "󰈔 New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("r", "󱔗 Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("f", "󰱼 Find file", ":Telescope find_files<CR>"),
			dashboard.button("g", "󰺮 Find text", ":Telescope live_grep <CR>"),
			dashboard.button("q", " Quit", ":qa<CR>"),
		}

		-- Footer
		local function footer()
			local version = vim.version()
			local pluginCount = vim.fn.len(vim.fn.globpath(vim.fn.stdpath("data") .. "/lazy", "*", 0, 1))
			local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
			local date = os.date("%d.%m.%Y")
			--local datetime = os.date '%d.%m.%Y %H:%M'
			return " " .. print_version .. "   " .. pluginCount .. "   " .. date
		end

		dashboard.section.footer.val = footer()

		-- Colors
		-- defined in color theme (after/plugin/neosolarized.rc.lua)
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Setup
		alpha.setup(dashboard.config)
	end,
}
