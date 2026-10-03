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
		require("dap").configurations.javascript = { -- Javascript
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
    "rcarriga/nvim-dap-ui",
    depndencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
        local dap = require("dap")
       local dapui = require("dapui")

        dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      layouts = {
        {
          -- left column: scopes/registers/watches/breakpoints (Keil-like sidebar)
          elements = {
            { id = "scopes",      size = 0.35 },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks",      size = 0.20 },
            { id = "watches",     size = 0.25 },
          },
          size = 45,
          position = "left",
        },
        {
          -- bottom: console + REPL (gdb/openocd output, RTT if enabled)
          elements = {
            { id = "repl",    size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 12,
          position = "bottom",
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = "rounded",
      },
    })
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open() 
    end
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.close()
    end
    local dap = require("dap")
vim.keymap.set("n", "<F5>",  dap.continue,         { desc = "Continue" })
vim.keymap.set("n", "<F10>", dap.step_over,        { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into,        { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out,         { desc = "Step Out" })
vim.keymap.set("n", "<leader>b",  dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.toggle,       { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dw", function()
    require("dapui").elements.watches.add(vim.fn.expand("<cword>"))
end,
{desc = "Add watch under cursor"}
)
end,
},
{
    "jedrzejboczar/nvim-dap-cortex-debug",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
        require('dap-cortex-debug').setup {
            debug = false, -- log debug messages
            -- path to cortex-debug extension, supports vim
            -- by default tries to guess: mason.nvim or VScode
            extension_path = "$HOME/build/cortex-debug/",
            lib_extension = nil,
            node_path = 'node',
            dapui_rtt = true, -- register nvim-dap-ui dapui_rtt

            -- make: DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
            dap_vscode_filetypes = {'c', 'cpp'},
            rtt = {
                buftype = 'Terminal', -- 'Terminal' or 'Bufterminal'
            }
        }
        local dap_cortex_debug = require('dap-cortex-debug')
        require('dap').configurations.c = {{
            name = 'STM32F446RE OpenOCD',
            type = 'cortex-debug',
            request = 'launch',
            servertype = 'openocd',
            cwd = '${workspaceFolder}',
            executable = function()
                local root = vim.fn.expand('%:p:h') -- directory of currently open file
                local axfs = vim.fn.glob(root .. '/out/**/*.axf', false, true)
                if #axfs == 0 then
                    error('No .axf file found in'.. root .. 'Objects/')
                elseif #axfs > 1 then
                    return vim.fn.input('Select executable: ', axfs[1])
                end
                return axfs[1]
            end,
            configFiles = {'interface/stlink.cfg',
                            'target/stm32f4x.cfg'
        },
            gdbPath = 'arm-none-eabi-gdb',
            runToEntryPoint = 'main',
            rttConfig = dap_cortex_debug.rtt_config(0),
            svdFile = vim.fn.getcwd() .. '/home/Jawsh/CMSISPacks/Keil/STM32F4xx_DFP/2.17.1/CMSIS/SVD/STM32F446.svd',
            showDevDebugOutput = false,
        }
    }
    end
},

{
	"mfussenegger/nvim-dap-python",
	config = function()
		require("dap-python").setup("python3")
	end
},




}
