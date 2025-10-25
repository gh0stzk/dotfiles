return {
	"vimichael/floatingtodo.nvim",
	config = function()
		local floatingtodo = require("floatingtodo")
		local target_file = vim.fn.expand("~/notes/todo.md")
		local directory_path = vim.fn.fnamemodify(target_file, ":h")

		-- Check directory
		if vim.fn.isdirectory(directory_path) == 0 then
			vim.fn.mkdir(directory_path, "p") -- parent folders 
			print("📁 To-do Directory created: " .. directory_path)
		else
			-- print("✅ To-do Directory already exists: " .. directory_path)
		end

		-- touch file
		if vim.fn.filereadable(target_file) == 0 then
			-- writefile dengan array kosong akan membuat file kosong
			local ok, err = pcall(vim.fn.writefile, {}, target_file)
			if ok then
				print("📝 To-do File created: " .. target_file)
			else
				vim.notify("Failed to Create file: " .. tostring(err), vim.log.levels.ERROR)
			end
		else
			-- print("✅ To-do File already exists: " .. target_file)
		end

		-- Floating todo
		floatingtodo.setup({
			target_file = target_file,
			border = "single", -- single, rounded, etc.
			width = 0.8,   -- width of window in % of screen size
			height = 0.8,  -- height of window in % of screen size
			position = "topright", -- topleft, topright, bottomleft, bottomright
		})

		-- Keymap
		vim.keymap.set({"n", "v"}, "<leader>td", ":Td<CR>", { silent = true, desc = "Open Floating Todo" })
	end,
}
