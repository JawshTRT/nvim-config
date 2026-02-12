-- For nvim-dap configuration and debuggers
return {
{
	"mfussenegger/nvim-dap",
	config = function()
		require("dap").adapters.debugpy = {
			type = "executable",
			command = "/usr/lib/python3.14/site-packages/debugpy/",
			name = "debugpy"
		}
		local debugpy = {
			name = "Launch debugpy",
			type = "debugpy",
			request = "launch",
			program = function()
				return vim.fn.input("/usr/lib/python3.14/site-packages/debugpy/__main__.py",
				vim.fn.getcwd() .. "/",
				"python`"
				)
			end,
			cwd = "${workspaceFolder}$",
			stopOnEntry = false,
			args = {},
			runInTerminal = false,
		}
		require("dap").configurations.python = {
			debugpy
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
