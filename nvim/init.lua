-- Folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Visual aid
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Indentation
vim.o.sw = 2
vim.o.expandtab = true
vim.o.tabstop = 2

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Colors
vim.cmd.colorscheme 'lunaperche'
vim.o.bg = 'light'
