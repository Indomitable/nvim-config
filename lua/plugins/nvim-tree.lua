-- https://raw.githubusercontent.com/nvim-tree/nvim-tree.lua/master/doc/nvim-tree-lua.txt

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local tree = require("nvim-tree")

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		tree.setup()

		local treeApi = require("nvim-tree.api")

		-- can use
		-- keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		-- to execute command instead of using the api.
		vim.keymap.set("n", "<leader>tt", treeApi.tree.toggle, { desc = "[T]oggle [T]ree view" })
		vim.keymap.set("n", "<leader>tf", function()
			treeApi.tree.find_file({ open = true, focus = true })
		end, { desc = "[T]ree [F]ind" })
	end,
}
