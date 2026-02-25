require("config.lazy")
--local vim = vim
--local Plug = vim.fn['plug#']
--
--vim.call('plug#begin')
----lsp plugins
----Telescoping plugins"
--vim.call('plug#end')
vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true
vim.o.termguicolors = true --Enable 24-bit RGB colors

--Formatting stuff

vim.bo.tabstop = 4 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 4 -- size of an indentation (sw).
vim.bo.expandtab = true -- always uses spaces instead of tab characters
vim.bo.softtabstop = 4 -- number of spaces a <Tab> counts for. When 0, feature is off


--
--
--vim.cmd('silent! colorscheme tokyonight-night')
--
--
----Load plugin manager
--
----Enable syntex highlighting for languages
--vim.cmd('syntax enable')
