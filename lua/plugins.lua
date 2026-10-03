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
{
    "stevearc/overseer.nvim",
    --- @module 'overseer',
    --- @type overseer.SetupOpts,
    opts = {},
    config = function()
        require("overseer").setup()
    end
},
{
	"HadyMash/greekvars.nvim",
	ft = {"lua", "python", "javascript", "typescript", "cpp", "octave"},
	config = function()
		require("greekvars").setup()
	end,
},
{
    "richwomanbtc/overleaf.nvim",
    config = function()
        require('overleaf').setup({
            log_level = 'debug';
        })
    end,
},
{'tranvansang/octave.vim'},
{"lervag/vimtex"},
{
    "sudormrfbin/cheatsheet.nvim",
    config = function()
        require("cheatsheet").setup({
            bundled_cheatsheets = {
                disabled = {"nerd-fonts", "unicode", "regex"}
            },
            bundled_plugin_cheatsheets = {
                disabled = {"gitsigns.nvim"},
            }
        })
    end
},

{"nvim-lua/popup.nvim"},
{"BurntSushi/ripgrep"},
{"nvim-neotest/nvim-nio"},
}
