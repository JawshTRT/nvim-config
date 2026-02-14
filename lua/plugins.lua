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
			pattern  = {'python', 'lua', 'c', 'latex', 'javascript'},
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
{
	"nvim-telescope/telescope-project.nvim",
	dependencies = {"nvim-telescope/telescope.nvim"},
	config = function()
		require'telescope'.load_extension('project')
	end
},
{
	"nvim-mini/mini.pairs",
	config = function()
		require("mini.pairs").setup()
	end

, version = false},
{"gnu-octave/vim-octave"},
{"lervag/vimtex"},
{"sudormrfbin/cheatsheet.nvim"},
{"nvim-lua/popup.nvim"},
{"BurntSushi/ripgrep"},
}
