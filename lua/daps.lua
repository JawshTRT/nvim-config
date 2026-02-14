-- For nvim-dap configuration and debuggers
return {
{
	"mfussenegger/nvim-dap",
	config = function()
		--Setting up debug adapters
		require("dap").adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = "/usr/lib/node_modules/vscode-js-debug/src/dapDebugServer.js", "${port}",
			}

		}
		--Setting up configurations
		require("dap").configurations.javascript = {
			{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		}

	    --Mapping keybinds for debugger
	    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
	    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
	    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
	    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
	    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
	    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
	end,

	


},
{
	"mfussenegger/nvim-dap-python",
	config = function()
		require("dap-python").setup("python3")
	end
},




}
