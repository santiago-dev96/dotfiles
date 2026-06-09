-- Core option changes.

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.sw = 2
vim.o.expandtab = true
vim.o.tabstop = 2
-- vim.cmd.color 'habamax'
vim.o.background = 'light'
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('lazy_setup')
require('harpoon_setup')
require('lualine_setup')
require('persistence_setup')
require('gitsigns_setup')
require('nvim_treesitter_setup')
