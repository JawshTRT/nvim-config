return { {
	"folke/tokyonight.nvim",
	lazy=false,
	priority = 1000,
	config = function()
		--load the colorscheme here
		vim.cmd([[colorscheme tokyonight-night]])
	end,
},
{
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern  = {'python', 'lua', 'c', 'latex'},
			callback = function() vim.treesitter.start() end,
		})
	end

},
{
	"neovim/nvim-lspconfig",
	lazy= false,
	config = function()
	--enabling language servers, currently using the default configurations unless otherwise specified
	end,
},
{
	'mfussenegger/nvim-lint',
	config = function()
		require("lint").linters_by_ft = {
			lua = {"luac"},
			c = {"cppcheck"}
		}
		vim.api.nvim_create_autocmd({"BufWritePost"}, {
  		callback = function()
		        require("lint").try_lint()
		end,
	})
	end
},

{
	"yuukiflow/Arduino-Nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Load Arduino plugin for .ino files
		vim.api.nvim_create_autocmd("FileType", {
		pattern = "arduino",
		callback = function()
			require("Arduino-Nvim")
		end,
		})
	end,
},
{
	"nvim-telescope/telescope.nvim", version = '*',
	dependencies = {"nvim-lua/plenary.nvim"},
	config = function()
		require("telescope").setup {
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
				},		
			}

		}
		require('telescope').load_extension('file_browser')

	end

},
{
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim",
	}
},

{"lervag/vimtex"},
{"nvim-mini/mini.pairs", version = false},
{"sudormrfbin/cheatsheet.nvim"},
{"nvim-lua/popup.nvim"},
{"BurntSushi/ripgrep"},
}
