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
	config = function()
		require('nvim-treesitter').install{'c', 'lua', 'rust', 'python'}
	end
	
},
{
	"neovim/nvim-lspconfig",
	lazy= false,
	config = function()
	--enabling language servers, currently using the default configurations unless otherwise specified
	vim.lsp.enable('luaconf')
	vim.lsp.enable('clangd') 
	end,		
	--extending a config??
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
	opts = function (_, opts)
		local esp32 = require("esp32")
		opts.servers = opts.servers or {}
		opts.servers.clangd = esp32.lsp_config()
		return opts
	end
	end
},
{
	"nvim-telescope/telescope.nvim", version = '*',
	dependencies = {"nvim-lua/plenary.nvim"}

},
{
	"nvim-mini/mini.completion",
	version = false,
	config = function()
		require('mini.completion').setup({})
	end
},
{"lervag/vimtex"},
{"nvim-mini/mini.pairs", version = false},
{"sudormrfbin/cheatsheet.nvim"},
{"nvim-lua/popup.nvim"},
{"BurntSushi/ripgrep"},
}
