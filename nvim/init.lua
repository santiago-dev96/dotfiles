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

-- Statusline
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim'
})
vim.o.showmode = false
require('lualine').setup()

-- Colors
vim.pack.add {
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
}
vim.cmd.colorscheme 'catppuccin-mocha'
vim.o.background = 'dark'
