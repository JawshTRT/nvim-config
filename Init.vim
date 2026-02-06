call plug#begin()
" List your plugins here"
"Color schemes"
Plug 'folke/tokyonight.nvim'
Plug 'RostislavArts/naysayer.nvim' 
Plug 'nvim-treesitter/nvim-treesitter'
"lsp plugins"
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'nvim-mini/mini.nvim' 
"Telescoping plugins"
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

let $TERM = 'ghostty'
let g:vimtex_view_general_viewer = 'evince'



"Indicating location of system wide python environment"
let g:python3_host_prog = '/usr/bin/python3'
lua << EOF
vim.opt.relativenumber = true
vim.opt.number = true
EOF

"Setting colorschemes for nvim"
colorscheme tokyonight-night


"Enabling vim plugins"
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
require("mini.completion").setup()
require'nvim-treesitter'.install {'rust', 'python', 'java', 'rust', 'lua'}
EOF

"Enabling syntax highlighting for languages"
lua << EOF
vim.api.nvim_create_autocmd('FileType', {
	pattern = {'vim', 'python', 'lua', 'java', 'rust', 'java'}, --List languages to highlight in here
	callback = function() vim.treesitter.start() end
	})



EOF
syntax enable
"Enabling language server protocols"
lua << EOF
--Lua lsp config
 vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})
--Commenting in lua is with 2 dashes btw
vim.lsp.enable('luals')
EOF

