return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "[D]ebug [R]un" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "[D]ebug step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "[D]ebug step [I]nto" })
			vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "[D]ebug [T]erminate" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "[T]oggle [B]reakpoint" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
			--vim.g.dap_virtual_text = true
		end,
	},
	{
		"leoluz/nvim-dap-go",
		opts = {
			-- Additional dap configurations can be added.
			-- dap_configurations accepts a list of tables where each entry
			-- represents a dap configuration. For more details do:
			-- :help dap-configuration
			dap_configurations = {
				{
					-- Must be "go" or it will be ignored by the plugin
					type = "go",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
				},
			},
		},
	},
    {
        "NicholasMata/nvim-dap-cs",
        config = function ()
           require('dap-cs').setup()
        end
    }
}
